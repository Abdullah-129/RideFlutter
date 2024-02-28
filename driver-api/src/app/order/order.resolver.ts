import { CRUDResolver, InjectPubSub } from '@nestjs-query/query-graphql';
import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Float, ID, Int, Mutation, Query, Resolver } from '@nestjs/graphql';
import { InjectRepository } from '@nestjs/typeorm';
import { Point } from '@ridy/database';
import { SOSEntity } from '@ridy/database/sos.entity';
import { DriverRedisService } from '@ridy/redis/driver-redis.service';
import { OrderRedisService } from '@ridy/redis/order-redis.service';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';
import { UserContext } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { DriverOrderQueryService } from './driver-order.query-service';
import { AvailableOrderDTO } from './dto/available-order.dto';
import { OrderDTO } from './dto/order.dto';
import { SOSDTO } from './dto/sos.dto';
import { UpdateOrderInput } from './dto/update-order.input';
import { OrderService } from './order.service';


@Resolver(() => OrderDTO)
@UseGuards(GqlAuthGuard)
export class OrderResolver extends CRUDResolver(OrderDTO, {
  UpdateDTOClass: UpdateOrderInput,
  create: { disabled: true },
  update: { many: { disabled: true } },
  delete: { disabled: true },
  enableAggregate: true
}) {
  constructor(
    public readonly driverOrderService: DriverOrderQueryService,
    @Inject(CONTEXT) private context: UserContext,
    private orderService: OrderService,
    private driverRedisService: DriverRedisService,
    @InjectPubSub()
    private redisPubSub: RedisPubSub,
    @InjectRepository(SOSEntity)
    private sosRepo: Repository<SOSEntity>
  ) {
    super(driverOrderService);
  }

  // @Query(() => OrderDTO)
  // async currentOrder(): Promise<OrderDTO> {
  //   return this.orderRepository.findOne({ driverId: this.context.req.user.id, status: In([OrderStatus.DriverAccepted, OrderStatus.Arrived, OrderStatus.Started, OrderStatus.WaitingForPostPay]) });
  // }

  @Query(() => [OrderDTO])
  async availableOrders(): Promise<OrderDTO[]> {
    return this.orderService.getOrdersForDriver(this.context.req.user.id);
  }

  @Mutation(() => [OrderDTO])
  async updateDriversLocationNew(@Args('point', { type: () => Point }) point: Point): Promise<AvailableOrderDTO[]> {
    this.redisPubSub.publish('driverLocationUpdated', { driverId: this.context.req.user.id, point });
    await this.driverRedisService.setLocation(this.context.req.user.id, point);
    return this.orderService.getOrdersForDriver(this.context.req.user.id);
  }

  @Mutation(() => SOSDTO)
  @UseGuards(GqlAuthGuard)
  async sosSignal(@Args('orderId', { type: () => ID }) requestId: number, @Args('location', { type: () => Point, nullable: true }) location?: Point): Promise<SOSDTO> {
    return this.sosRepo.save({
      submittedByRider: false,
      location,
      requestId
    });
  }
}
