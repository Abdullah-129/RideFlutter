import { Logger, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { GraphQLModule } from '@nestjs/graphql';
import { ScheduleModule } from '@nestjs/schedule';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CryptoService, DatabaseModule, entities } from '@ridy/database';
import { RedisModule } from '@liaoliaots/nestjs-redis';
import { join } from 'path';

import { AuthModule } from './auth/auth.module';
import { validateToken } from './auth/jwt.strategy';
import { DriverAPIController } from './driver-api.controller';
import { DriverModule } from './driver/driver.module';
import { OrderModule } from './order/order.module';
import { UploadModule } from './upload/upload.module';
import { AnnouncementsModule } from './announcemnts/announcements.module';
import { WalletModule } from './wallet/wallet.module';
import { ServiceModule } from './service/service.module';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { ChatModule } from './chat/chat.module';
import { ComplaintModule } from './complaint/complaint.module';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';

@Module({
  imports: [
    DatabaseModule,
    ServiceModule,
    ConfigModule.forRoot(),
    ScheduleModule.forRoot(),
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      cors: false,
      subscriptions: {
        'subscriptions-transport-ws': {
          keepAlive: 5000,
          onConnect: async (connectionParams: { authToken: string }) => {
            if (connectionParams.authToken) {
              return validateToken(connectionParams.authToken);
            }
            throw new Error('Missing auth token!');
          },
        },
      },
      autoSchemaFile: join(process.cwd(), 'apps/driver-app/driver.schema.gql'),
      buildSchemaOptions: {
        dateScalarMode: 'timestamp',
      },
      // context: ({ req, res, payload, connection }) => ({
      //   req,
      //   res,
      //   payload,
      //   connection,
      // }),
    }),
    TypeOrmModule.forFeature(entities),
    AuthModule.register(),
    UploadModule,
    DriverModule,
    ChatModule,
    OrderModule,
    WalletModule,
    RedisModule.forRoot({
      closeClient: true,
      commonOptions: { db: 2 },
      config: {
        host: process.env.REDIS_HOST ?? 'localhost',
      },
    }),
    AnnouncementsModule,
    ComplaintModule,
  ],
  controllers: [DriverAPIController],
  providers: [CryptoService, SharedDriverService],
})
export class DriverAPIModule {}
