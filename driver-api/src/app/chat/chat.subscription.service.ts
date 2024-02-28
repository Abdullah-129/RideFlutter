import { InjectPubSub } from "@nestjs-query/query-graphql";
import { Injectable, Logger } from "@nestjs/common";
import { Subscription } from "@nestjs/graphql";
import { RedisPubSub } from "graphql-redis-subscriptions";
import { OrderMessageDTO } from "./dto/order-message.dto";

@Injectable()
export class ChatSubscriptionService {
    constructor(
        @InjectPubSub()
        private pubSub: RedisPubSub
    ) {}
    
    @Subscription(() => OrderMessageDTO, {
        filter(
            this: ChatSubscriptionService,
            payload: { newMessageReceived: OrderMessageDTO, driverId: number },
            variables,
            context
        ) {
            Logger.log(context);
            Logger.log(payload);
            return context.id == payload.driverId;
        },
    })
    newMessageReceived() {
        return this.pubSub.asyncIterator('newMessageForDriver');
    }
}