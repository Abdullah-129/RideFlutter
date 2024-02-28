import { DynamicModule, Logger, Module, Provider } from '@nestjs/common';
import { HttpModule } from '@nestjs/axios';
import { GraphQLModule } from '@nestjs/graphql';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DatabaseModule, entities } from '@ridy/database';
import { join } from 'path';

import { AccountingModule } from './accounting/accounting.module';
import { AddressModule } from './address/address.module';
import { AppController } from './admin-api.controller';
import { AnnouncementModule } from './announcement/announcement.module';
import { CarModule } from './car/car.module';
import { CouponModule } from './coupon/coupon.module';
import { DriverModule } from './driver/driver.module';
import { FeedbackModule } from './feedback/feedback.module';
import { FleetModule } from './fleet/fleet.module';
import { OperatorModule } from './operator/operator.module';
import { OrderModule } from './order/order.module';
import { PaymentGatewayModule } from './payment-gateway/payment-gateway.module';
import { RegionModule } from './region/region.module';
import { RiderModule } from './rider/rider.module';
import { ServiceModule } from './service/service.module';
import { AuthModule } from './auth/auth.module';
import { UploadModule } from './upload/upload.module';
import { ComplaintModule } from './complaint/complaint.module';
import { existsSync, promises as fs } from 'fs';
import { ConfigurationModule } from './config/configuration.module';
import { UploadService } from './upload/upload.service';
import { RedisModule } from '@liaoliaots/nestjs-redis';
import { validateToken } from './auth/jwt.strategy';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { SOSModule } from './sos/sos.module';
import { RewardModule } from './reward/reward.module';

@Module({
  // imports: [
  //   DatabaseModule,
  //   GraphQLModule.forRoot({
  //     installSubscriptionHandlers: true,
  //     autoSchemaFile: join(process.cwd(), 'admin.schema.gql'),
  //     //uploads: false,
  //     cors: false
  //   }),
  //   TypeOrmModule.forFeature(entities),
  //   ServiceModule,
  //   OperatorModule,
  //   RiderModule,
  //   DriverModule,
  //   FleetModule,
  //   OrderModule,
  //   AnnouncementModule,
  //   CouponModule,
  //   AccountingModule,
  //   RegionModule,
  //   PaymentGatewayModule,
  //   CarModule,
  //   FeedbackModule,
  //   AddressModule,
  //   AuthModule,
  //   UploadModule,
  //   ComplaintModule,
  //   ConfigurationModule,
  //   HttpModule
  // ],
  // providers: [],
  // controllers: [AppController]
})
export class AdminAPIModule {
  static async register(): Promise<DynamicModule> {
    const configAddress = `${process.cwd()}/config/config.${
      process.env.NODE_ENV
    }.json`;
    if (existsSync(configAddress)) {
      const file = await fs.readFile(configAddress, { encoding: 'utf-8' });
      const config = JSON.parse(file as string);
      const firebaseKeyFileAddress = `${process.cwd()}/config/${
        config.firebaseProjectPrivateKey
      }`;
      if (
        config.firebaseProjectPrivateKey != null &&
        existsSync(firebaseKeyFileAddress)
      ) {
        return {
          module: AdminAPIModule,
          imports: [
            DatabaseModule,
            GraphQLModule.forRoot<ApolloDriverConfig>({
              driver: ApolloDriver,
              subscriptions: {
                'subscriptions-transport-ws': {
                  //keepAlive: 5000,
                  onConnect: async (connectionParams: {
                    authToken: string;
                  }) => {
                    if (connectionParams.authToken) {
                      return validateToken(connectionParams.authToken);
                    }
                    throw new Error('Missing auth token!');
                  },
                  onDisconnect: () => {
                  },
                },
              },
              autoSchemaFile: join(process.cwd(), 'admin.schema.gql'),
              cors: false,
            }),
            TypeOrmModule.forFeature(entities),
            ServiceModule,
            OperatorModule,
            RiderModule,
            DriverModule,
            FleetModule,
            OrderModule,
            AnnouncementModule,
            CouponModule,
            AccountingModule,
            RegionModule,
            PaymentGatewayModule,
            CarModule,
            FeedbackModule,
            AddressModule,
            AuthModule,
            UploadModule,
            SOSModule,
            RewardModule,
            ComplaintModule,
            ConfigurationModule,
            HttpModule,
            RedisModule.forRoot({
              closeClient: true,
              commonOptions: { db: 2 },
              config: {
                host: process.env.REDIS_HOST ?? 'localhost'
              },
            }),
          ],
          providers: [UploadService],
          controllers: [AppController],
        };
      }
    }
    return {
      module: AdminAPIModule,
      imports: [
        HttpModule,
        GraphQLModule.forRoot<ApolloDriverConfig>({
          driver: ApolloDriver,
          autoSchemaFile: true,
          cors: false,
          //uploads: false,
        }),
        ConfigurationModule,
      ],
    };
  }
}
