import { forwardRef, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CommonCouponModule } from '@ridy/coupon/common-coupon.module';

import { CouponEntity } from '@ridy/database/coupon.entity';
import { PaymentEntity } from '@ridy/database/payment.entity';
import { RequestEntity } from '@ridy/database/request.entity';
import { SharedOrderModule } from '@ridy/order/shared-order.module';
import { OrderModule } from '../order/order.module';
import { CouponResolver } from './coupon.resolver';
import { CouponService } from './coupon.service';

@Module({
  imports: [
    forwardRef(() => OrderModule),
    SharedOrderModule,
    CommonCouponModule,
    TypeOrmModule.forFeature([RequestEntity, CouponEntity, PaymentEntity]),
    // NestjsQueryGraphQLModule.forFeature({
    //   imports: [NestjsQueryTypeOrmModule.forFeature([CouponEntity])],
    //   resolvers: [
    //     {
    //       EntityClass: CouponEntity,
    //       DTOClass: CouponDTO,
    //       create: { disabled: true },
    //       read: { disabled: true },
    //       delete: { disabled: true },
    //       update: { disabled: true },
    //       guards: [GqlAuthGuard],
    //       pagingStrategy: PagingStrategies.NONE,
    //     },
    //   ],
    // }),
  ],
  providers: [CouponService, CouponResolver],
  exports: [CouponService],
})
export class CouponModule {}
