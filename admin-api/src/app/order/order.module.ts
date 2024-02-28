import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RedisPubSubProvider } from '@ridy/database';
import { RequestActivityEntity } from '@ridy/database/request-activity.entity';
import { OrderMessageEntity } from '@ridy/database/request-message.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { SharedOrderModule } from '@ridy/order/shared-order.module';
import { RedisHelpersModule } from '@ridy/redis/redis-helper.module';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { DispatcherResolver } from './dispatcher.resolver';
import { OrderMessageDTO } from './dto/order-message.dto';
import { OrderDTO } from './dto/order.dto';
import { OrderSubscriptionService } from './order-subscription.service';
import { OrderService } from './order.service';

@Module({
  imports: [
    SharedOrderModule,
    RedisHelpersModule,
    TypeOrmModule.forFeature([RequestActivityEntity]),
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          RequestEntity,
          OrderMessageEntity
        ]),
      ],
      pubSub: RedisPubSubProvider.provider(),
      resolvers: [
        {
          EntityClass: RequestEntity,
          DTOClass: OrderDTO,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          enableAggregate: true,
          guards: [JwtAuthGuard],
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
        {
          EntityClass: OrderMessageEntity,
          DTOClass: OrderMessageDTO,
          pagingStrategy: PagingStrategies.OFFSET,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
      ],
    }),
  ],
  providers: [
    DispatcherResolver,
    OrderSubscriptionService,
    OrderService,
    RedisPubSubProvider.provider(),
  ],
})
export class OrderModule {}
