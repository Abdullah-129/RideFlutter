import { InjectPubSub } from "@nestjs-query/query-graphql";
import { Injectable } from "@nestjs/common";
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
            payload: { newMessageReceived: OrderMessageDTO, riderId: number },
            variables,
            context
        ) {
            return context.id == payload.riderId;
        },
    })
    newMessageReceived() {
        return this.pubSub.asyncIterator('newMessageForRider');
    }
}