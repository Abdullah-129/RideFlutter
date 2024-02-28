import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { PaymentGatewayViewComponent } from './payment-gateway-view/payment-gateway-view.component';
import { PaymentGatewayViewResolver } from './payment-gateway-view/payment-gateway-view.resolver';
import { PaymentGatewayListResolver } from './payment-gateways-list/payment-gateway-list.resolver';
import { PaymentGatewaysListComponent } from './payment-gateways-list/payment-gateways-list.component';


const routes: Routes = [
  { path: '', component: PaymentGatewaysListComponent, resolve: {paymentGateways: PaymentGatewayListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange'},
  { path: 'view/:id', component: PaymentGatewayViewComponent, resolve: {paymentGateway: PaymentGatewayViewResolver } },
  { path: 'new', component: PaymentGatewayViewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    PaymentGatewayListResolver,
    PaymentGatewayViewResolver
  ]
})
export class ManagementPaymentGatewaysRoutingModule { }
