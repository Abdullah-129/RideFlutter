import { Authorize, FilterableField, IDField, Relation, UnPagedRelation } from '@nestjs-query/query-graphql';
import { Field, GraphQLTimestamp, ID, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@ridy/database';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';

import { UserContext } from '../../auth/authenticated-user';
import { OrderMessageDTO } from '../../chat/dto/order-message.dto';
import { RiderDTO } from '../../rider/dto/rider.dto';
import { ServiceOptionDTO } from '../../service/dto/service-option.dto';
import { ServiceDTO } from '../../service/dto/service.dto';
import { PaymentGatewayDTO } from '../../wallet/dto/payment-gateway.dto';
import { DriverDTO } from './driver.dto';

@ObjectType('Order')
@Authorize({
    authorize: (context: UserContext) => ({riderId: {eq: context.req.user.id}})
})
@Relation('driver', () => DriverDTO, { nullable: true, disableRemove: true, disableUpdate: true })
@Relation('rider', () => RiderDTO, { disableRemove: true, disableUpdate: true })
@Relation('service', () => ServiceDTO, { disableRemove: true, disableUpdate: true })
@UnPagedRelation('options', () => ServiceOptionDTO, { disableRemove: true, disableUpdate: true })
@Relation('paymentGateway', () => PaymentGatewayDTO, { nullable: true, disableRemove: true, disableUpdate: true })
@UnPagedRelation('conversation', () => OrderMessageDTO, { relationName: 'conversation', disableRemove: true, disableUpdate: true })
export class OrderDTO {
    @IDField(() => ID)
    id: number;
    @FilterableField(() => OrderStatus)
    status: OrderStatus;
    @FilterableField(() => GraphQLTimestamp)
    createdOn: Date;
    @Field(() => Int)
    distanceBest!: number;
    @Field(() => Int)
    durationBest!: number;
    @Field(() => Int)
    waitMinutes!: number;
    points: Point[];
    addresses: string[];
    expectedTimestamp!: Date;
    startTimestamp?: Date;
    finishTimestamp?: Date;
    @FilterableField(() => ID)
    riderId: number;
    @FilterableField(() => ID, { nullable: true })
    driverId?: number;
    costAfterCoupon: number;
    etaPickup?: Date;
    costBest: number;
    paidAmount: number;
    currency: string;
    directions?: Point[];
}