import {
  Controller,
  Get,
  Post,
  Req,
  Res,
  UseGuards,
  Request,
  Logger,
} from '@nestjs/common';
import { RiderRechargeTransactionType } from '@ridy/database/enums/rider-recharge-transaction-type.enum';
import { TransactionAction } from '@ridy/database/enums/transaction-action.enum';
import { TransactionStatus } from '@ridy/database/enums/transaction-status.enum';
import { SharedRiderService } from '@ridy/order/shared-rider.service';
import { FastifyReply, FastifyRequest } from 'fastify';
import * as fastify from 'fastify';
import { join } from 'path';
import { pipeline } from 'stream';
import { promisify } from 'util';
import { createWriteStream, promises } from 'fs';

const pump = promisify(pipeline);

import { RestJwtAuthGuard } from './auth/rest-jwt-auth.guard';
import { InjectRepository } from '@nestjs/typeorm';
import { RiderEntity } from '@ridy/database/rider-entity';
import { Repository } from 'typeorm';
import { MediaEntity } from '@ridy/database/media.entity';
import { CryptoService } from '@ridy/database';
import { RiderOrderService } from './order/rider-order.service';
import { SharedOrderService } from '@ridy/order/shared-order.service';
import { InjectPubSub } from '@nestjs-query/query-graphql';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';
import { version } from 'package.json';
import { PaymentStatus } from '@ridy/database/enums/payment-status.enum';

@Controller()
export class RiderAPIController {
  constructor(
    private sharedRiderService: SharedRiderService,
    private sharedOrderService: SharedOrderService,
    private riderOrderService: RiderOrderService,
    private cryptoService: CryptoService,
    @InjectPubSub()
    private pubSub: RedisPubSub,
    @InjectRepository(RiderEntity)
    private riderRepository: Repository<RiderEntity>,
    @InjectRepository(MediaEntity)
    private mediaRepository: Repository<MediaEntity>
  ) {}

  @Get()
  async defaultPath(@Res() res: fastify.FastifyReply) {
    res.send(`✅ Rider API microservice running.\nVersion: ${version}`);
  }

  @Get('payment_result')
  async verifyPayment(
    @Req()
    req: FastifyRequest<{
      Querystring: { token: string; redirect: '1' | '0' };
    }>,
    @Res() res: FastifyReply
  ) {
    const token = req.query.token;
    const decrypted = await this.cryptoService.decrypt(token);
    Logger.log('Payment:' + JSON.stringify(decrypted));

    if (decrypted.userType == 'client') {
      if (decrypted.status == 'success') {
        await this.sharedRiderService.rechargeWallet({
          riderId: decrypted.userId,
          amount: decrypted.amount,
          currency: decrypted.currency,
          refrenceNumber: decrypted.transactionNumber,
          action: TransactionAction.Recharge,
          rechargeType: RiderRechargeTransactionType.InAppPayment,
          paymentGatewayId: decrypted.gatewayId,
          status: TransactionStatus.Done,
        });
        let order = await this.riderOrderService.getCurrentOrder(
          decrypted.userId
        );
        if (order?.status == OrderStatus.WaitingForPostPay) {
          await this.sharedOrderService.finish(order.id);
          order = await this.riderOrderService.getCurrentOrder(
            decrypted.userId
          );
          this.pubSub.publish('orderUpdated', { orderUpdated: order });
        } else if (order?.status == OrderStatus.WaitingForPrePay) {
          order = await this.sharedOrderService.processPrePay(order.id);
          this.pubSub.publish('orderUpdated', { orderUpdated: order });
        }
        if (req.query.redirect == null || req.query.redirect == '1')
          res
            .code(301)
            .redirect(
              301,
              `${
                process.env.RIDER_APPLICATION_ID ?? 'default.rider.redirection'
              }://`
            );
        res.send(
          'Transaction successful. Close this page and go back to the app.'
        );
      } else if (decrypted.status == 'authorized') {
        let order = await this.riderOrderService.getCurrentOrder(
          decrypted.userId
        );
        order = await this.sharedOrderService.processPrePay(
          order.id,
          decrypted.amount
        );
        this.pubSub.publish('orderUpdated', { orderUpdated: order });
        res
          .code(301)
          .redirect(
            301,
            `${
              process.env.RIDER_APPLICATION_ID ?? 'default.rider.redirection'
            }://`
          );
        res.send(
          'Transaction successful. Close this page and go back to the app.'
        );
      } else {
        res
          .code(301)
          .redirect(
            301,
            `${
              process.env.RIDER_APPLICATION_ID ?? 'default.rider.redirection'
            }://`
          );
        res.send(
          "Transaction wasn't successful. You can go back to the app and redo this."
        );
      }
    }
  }

  @Post('upload_profile')
  @UseGuards(RestJwtAuthGuard)
  async upload(@Request() req: any, @Res() res: fastify.FastifyReply) {
    const data = await req.file();
    const dir = 'uploads';
    await promises.mkdir(dir, { recursive: true });
    const _fileName = join(dir, `${new Date().getTime()}-${data.filename}`);
    await pump(data.file, createWriteStream(_fileName));
    const insert = await this.mediaRepository.insert({ address: _fileName });
    await this.riderRepository.update((req as unknown as any).user.id, {
      mediaId: insert.raw.insertId,
    });
    res.code(200).send({ id: insert.raw.insertId, address: _fileName });
  }
}
