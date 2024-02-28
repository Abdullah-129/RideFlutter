import { QueryService } from '@nestjs-query/core';
import { InjectPubSub } from '@nestjs-query/query-graphql';
import { TypeOrmQueryService } from '@nestjs-query/query-typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { OrderMessageEntity } from '@ridy/database/request-message.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { RiderNotificationService } from '@ridy/order/firebase-notification-service/rider-notification.service';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';

import { OrderMessageDTO } from './dto/order-message.dto';
import { OrderMessageInput } from './dto/order-message.input';

@QueryService(OrderMessageEntity)
export class ChatService extends TypeOrmQueryService<OrderMessageEntity> {
    constructor(
        @InjectRepository(OrderMessageEntity)
        public repository: Repository<OrderMessageEntity>,
        @InjectRepository(RequestEntity)
        private requestRepository: Repository<RequestEntity>,
        @InjectPubSub()
        private pubSub: RedisPubSub,
        private riderNotificationService: RiderNotificationService
    ) {
        super(repository)
    }

    override async createOne(input: OrderMessageInput) {
        let message = await super.createOne({ ...input, sentByDriver: true });
        const order = await this.requestRepository.findOne(message.requestId, { relations: [ 'rider', 'driver' ]});
        message = await this.getById(message.id);
        this.riderNotificationService.message(order.rider, message);
        this.pubSub.publish<{ newMessageReceived: OrderMessageDTO, riderId: number }>('newMessageForRider', { newMessageReceived: message, riderId: order.riderId });
        return message;
    }
}