import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CouponsRoutingModule } from './coupons-routing.module';
import { CouponsListComponent } from './coupons-list/coupons-list.component';
import { CouponViewComponent } from './coupon-view/coupon-view.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';


@NgModule({
  declarations: [CouponsListComponent, CouponViewComponent],
  imports: [
    CommonModule,
    CouponsRoutingModule,
    SharedModule
  ]
})
export class CouponsModule { }
