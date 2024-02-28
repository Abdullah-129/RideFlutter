import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { RedisPubSubProvider } from '@ridy/database';
import { OrderMessageEntity } from '@ridy/database/request-message.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { FirebaseNotificationModule } from '@ridy/order/firebase-notification-service/firebase-notification-service.module';

import { OrderModule } from '../order/order.module';
import { ChatService } from './chat.service';
import { ChatSubscriptionService } from './chat.subscription.service';
import { OrderMessageDTO } from './dto/order-message.dto';
import { OrderMessageInput } from './dto/order-message.input';
import { DriverNotificationService } from '@ridy/order/firebase-notification-service/driver-notification.service';

@Module({
    imports: [
        OrderModule,
        FirebaseNotificationModule.register(),
        NestjsQueryGraphQLModule.forFeature({
            imports: [
        NestjsQueryTypeOrmModule.forFeature([OrderMessageEntity, RequestEntity]),
            ],
            services: [ChatService, DriverNotificationService],
            pubSub: RedisPubSubProvider.provider(),
            resolvers: [
                {
                    EntityClass: OrderMessageEntity,
                    DTOClass: OrderMessageDTO,
                    CreateDTOClass: OrderMessageInput,
                    ServiceClass: ChatService,
                    pagingStrategy: PagingStrategies.NONE,
                    create: { many: { disabled: true }},
                    read: { one: { disabled: true }},
                    update: { disabled: true },
                    delete: { disabled: true },
                    guards: [GqlAuthGuard]
                }
            ]
        })
    ],
    providers: [
        ChatSubscriptionService,
        RedisPubSubProvider.provider(),
    ]
})
export class ChatModule {}
