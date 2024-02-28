import { FilterableField, IDField, Relation, UnPagedRelation } from '@nestjs-query/query-graphql';
import { Field, ID, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@ridy/database';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';

import { ProviderTransactionDTO } from '../../accounting/dto/provider-transaction.dto';
import { ComplaintDTO } from '../../complaint/dto/complaint.dto';
import { CouponDTO } from '../../coupon/dto/coupon.dto';
import { DriverTransactionDTO } from '../../driver/dto/driver-transaction.dto';
import { DriverDTO } from '../../driver/dto/driver.dto';
import { FleetTransactionDTO } from '../../fleet/dto/fleet-transaction.dto';
import { RiderTransactionDTO } from '../../rider/dto/rider-transaction.dto';
import { RiderDTO } from '../../rider/dto/rider.dto';
import { ServiceDTO } from '../../service/dto/service.dto';
import { OrderMessageDTO } from './order-message.dto';
import { RequestActivityDTO } from './request-activity.dto';

@ObjectType('Order')
@Relation('driver', () => DriverDTO, { nullable: true })
@Relation('rider', () => RiderDTO, { nullable: true })
@Relation('service', () => ServiceDTO, { nullable: true })
@Relation('coupon', () => CouponDTO, { nullable: true })
@UnPagedRelation('complaints', () => ComplaintDTO)
@UnPagedRelation('conversation', () => OrderMessageDTO, { relationName: 'conversation'})
@UnPagedRelation('riderTransactions', () => RiderTransactionDTO)
@UnPagedRelation('driverTransactions', () => DriverTransactionDTO)
@UnPagedRelation('fleetTransactions', () => FleetTransactionDTO)
@UnPagedRelation('providerTransactions', () => ProviderTransactionDTO)
@UnPagedRelation('activities', () => RequestActivityDTO, {disableUpdate: true, disableRemove: true})
export class OrderDTO {
    @IDField(() => ID)
    id!: number;
    @FilterableField()
    createdOn!: Date;
    startTimestamp?: Date;
    finishTimestamp?: Date;
    @FilterableField(() => OrderStatus)
    status: OrderStatus;
    @Field(() => Int)
    distanceBest: number;
    @Field(() => Int)
    durationBest: number;
    costBest: number;
    costAfterCoupon: number;
    currency: string;
    waitMinutes!: number;
    addresses: string[];
    points: Point[];
    expectedTimestamp?: Date;
    @FilterableField(() => ID)
    riderId: number;
    @FilterableField(() => ID)
    driverId?: number;
}