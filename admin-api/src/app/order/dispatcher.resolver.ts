import { Inject, UseGuards } from '@nestjs/common';
import { Resolver, Query, Args, Mutation, CONTEXT, ID } from '@nestjs/graphql';
import { SharedOrderService } from '@ridy/order/shared-order.service';
import { UserContext } from '../auth/authenticated-admin';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { CalculateFareDTO } from './dto/calculate-fare.dto';
import { CalculateFareInput } from './dto/calculate-fare.input';
import { CreateOrderInput } from './dto/create-order.input';
import { OrderDTO } from './dto/order.dto';
import { OrderService } from './order.service';

@Resolver(() => OrderDTO)
export class DispatcherResolver {
  constructor(
    @Inject(CONTEXT) private context: UserContext,
    private sharedOrderService: SharedOrderService,
    private orderService: OrderService
  ) {}

  @Query(() => CalculateFareDTO)
  async calculateFare(
    @Args('input', { type: () => CalculateFareInput }) input: CalculateFareInput
  ): Promise<CalculateFareDTO> {
    return this.sharedOrderService.calculateFare({...input, twoWay: false});
  }

  @Mutation(() => OrderDTO)
  @UseGuards(JwtAuthGuard)
  async createOrder(
    @Args('input', { type: () => CreateOrderInput }) input: CreateOrderInput
  ): Promise<OrderDTO> {
    return this.sharedOrderService.createOrder({
      ...input,
      operatorId: this.context.req.user.id,
      twoWay: false,
      optionIds: []
    });
  }

  @Mutation(() => OrderDTO)
  async cancelOrder(@Args('orderId', { type: () => ID }) orderId: number): Promise<OrderDTO> {
    return this.orderService.cancelOrder(orderId);
  }

  @Mutation(() => OrderDTO)
  async assignDriverToOrder(@Args('orderId', { type: () => ID }) orderId: number, @Args('driverId',{ type: () => ID }) driverId: number): Promise<OrderDTO> {
    return this.sharedOrderService.assignOrderToDriver(orderId, driverId);
  }
}
