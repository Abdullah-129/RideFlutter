import { Logger, Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DatabaseModule, entities, RedisPubSubProvider } from '@ridy/database';
import { join } from 'path';

import { AuthModule } from './auth/auth.module';
import { RiderAPIController } from './rider-api.controller';
import { RiderModule } from './rider/rider.module';
import { UploadModule } from './upload/upload.module';
import { ServiceModule } from './service/service.module';
import { OrderModule } from './order/order.module';
import { AddressModule } from './address/address.module';
import { AnnouncementModule } from './announcement/announcement.module';
import { WalletModule } from './wallet/wallet.module';
import { CouponModule } from './coupon/coupon.module';
import { RedisModule } from '@liaoliaots/nestjs-redis';
import { validateToken } from './auth/jwt.strategy';
import { CryptoService } from '@ridy/database';
import { ChatModule } from './chat/chat.module';
import { ComplaintModule } from './complaint/complaint.module';
import { SharedOrderModule } from '@ridy/order/shared-order.module';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { ConfigModule } from "@nestjs/config";

@Module({
  imports: [
    DatabaseModule,
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      cors: false,
      autoSchemaFile: join(process.cwd(), 'apps/rider-app/rider.schema.gql'),
      buildSchemaOptions: {
        dateScalarMode: 'timestamp',
      },
      // context: ({ req, res, payload, connection }) => {
      //   return {
      //     req,
      //     res,
      //     payload,
      //     connection,
      //   };
      // },
      subscriptions: {
        'subscriptions-transport-ws': {
          keepAlive: 5000,
          onConnect: async (connectionParams: any) => {
            if (connectionParams.authToken) {
              return validateToken(connectionParams.authToken);
            }
            throw new Error('Missing auth token!');
          },
        },
      },
    }),
    TypeOrmModule.forFeature(entities),
    AuthModule.register(),
    UploadModule,
    RiderModule,
    ServiceModule,
    OrderModule,
    AddressModule,
    AnnouncementModule,
    SharedOrderModule,
    ComplaintModule,
    WalletModule,
    CouponModule,
    ConfigModule,
    RedisModule.forRoot({
      closeClient: true,
      commonOptions: { db: 2 },
      config: {
        host: process.env.REDIS_HOST ?? 'localhost',
      },
    }),
    ChatModule,
  ],
  providers: [
    CryptoService,
    RedisPubSubProvider.provider(),],
  controllers: [RiderAPIController],
})
export class RiderAPIModule {}
