import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Mutation, Resolver } from '@nestjs/graphql';
import { CommonCouponService } from '@ridy/coupon/common-coupon.service';

import { UserContext } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { OrderDTO } from '../order/dto/order.dto';
import { RiderOrderService } from '../order/rider-order.service';
import { RiderWalletDTO } from '../wallet/dto/rider-wallet.dto';
import { CouponService } from './coupon.service';

@Resolver(() => OrderDTO)
@UseGuards(GqlAuthGuard)
export class CouponResolver {
  constructor(
    private commonCouponService: CommonCouponService,
    private couponService: CouponService,
    private riderOrderService: RiderOrderService,
    @Inject(CONTEXT)
    private context: UserContext
  ) { }

  @Mutation(() => OrderDTO)
  async applyCoupon(
    @Args('code', { type: () => String }) code: string
  ): Promise<OrderDTO> {
    const currentOrder = await this.riderOrderService.getCurrentOrder(this.context.req.user.id);
    return this.commonCouponService.applyCoupon(code, currentOrder.id, this.context.req.user.id);
  }

  @Mutation(() => RiderWalletDTO)
  async redeemGiftCard(
    @Args('code', { type: () => String }) code: string
  ): Promise<RiderWalletDTO> {
    return this.couponService.redeemGiftCard(code, this.context.req.user.id);
  }
}
