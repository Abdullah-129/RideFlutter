import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CouponsListComponent } from './coupons-list/coupons-list.component';
import { CouponViewComponent } from './coupon-view/coupon-view.component';
import { CouponsListResolver } from './coupons-list/coupon-list.resolver';
import { CouponViewResolver } from './coupon-view/coupon-view.resolver';


const routes: Routes = [
  { path: '', component: CouponsListComponent, resolve: { coupons: CouponsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', component: CouponViewComponent, resolve: { coupon: CouponViewResolver } },
  { path: 'new', component: CouponViewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    CouponsListResolver,
    CouponViewResolver
  ]
})
export class CouponsRoutingModule { }
