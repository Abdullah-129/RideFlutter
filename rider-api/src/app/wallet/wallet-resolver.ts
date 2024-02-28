import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Mutation, Resolver } from '@nestjs/graphql';
import { InjectRepository } from '@nestjs/typeorm';
import { PaymentGatewayEntity } from '@ridy/database/payment-gateway.entity';
import { Repository } from 'typeorm';

import { UserContext } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import {
  TopUpWalletInput,
  TopUpWalletResponse,
  TopUpWalletStatus,
} from './dto/top-up-wallet.input';

@UseGuards(GqlAuthGuard)
@Resolver()
export class WalletResolver {
  constructor(
    @InjectRepository(PaymentGatewayEntity)
    private gatewayRepo: Repository<PaymentGatewayEntity>,
    @Inject(CONTEXT) private context: UserContext
  ) {}

  @Mutation(() => TopUpWalletResponse)
  async topUpWallet(
    @Args('input', { type: () => TopUpWalletInput }) input: TopUpWalletInput,
    @Args('shouldPreauth', { type: () => Boolean, nullable: true })
    shouldPreauth: boolean
  ): Promise<TopUpWalletResponse> {
    const gateway = await this.gatewayRepo.findOne(input.gatewayId);
    const params = `userType=client&userId=${
      this.context.req.user.id
    }&paymentGatewayId=${gateway.id}&ts=${new Date().getTime()}&amount=${
      input.amount
    }&currency=${input.currency}&orderNumber=${
      input.orderNumber
    }&shouldPreauth=${(shouldPreauth ? 1 : 0) ?? 0}&returnUrl=${
      process.env.RIDER_SERVER_URL
    }/payment_result`;
    return {
      status: TopUpWalletStatus.Redirect,
      url: `${process.env.GATEWAY_SERVER_URL}/pay?${params}`,
    };
  }
}
