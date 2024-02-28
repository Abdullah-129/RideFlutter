import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { RiderViewAddressesComponent } from './rider-view-addresses/rider-view-addresses.component';
import { RiderViewAddresssesResolver } from './rider-view-addresses/rider-view-addresses.resolver';
import { RiderViewFinancialsComponent } from './rider-view-financials/rider-view-financials.component';
import { RiderViewFinancialsResolver } from './rider-view-financials/rider-view-financials.resolver';
import { RiderViewInfoComponent } from './rider-view-info/rider-view-info.component';
import { RiderViewOrdersComponent } from './rider-view-orders/rider-view-orders.component';
import { RiderViewOrdersResolver } from './rider-view-orders/rider-view-orders.resolver';
import { RiderViewComponent } from './rider-view.component';
import { RiderViewResolver } from './rider-view.resolver';

const routes: Routes = [
  { path: '', component: RiderViewComponent, resolve: { rider: RiderViewResolver },runGuardsAndResolvers: 'paramsChange', children: [
    { path: '', redirectTo: 'details', pathMatch: 'full' },
    { path: 'details', component: RiderViewInfoComponent },
    { path: 'financials', component: RiderViewFinancialsComponent, resolve: { financials: RiderViewFinancialsResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
    { path: 'orders', component: RiderViewOrdersComponent, resolve: { orders: RiderViewOrdersResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
    { path: 'addresses', component: RiderViewAddressesComponent, resolve: { addresses: RiderViewAddresssesResolver } }
  ]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RiderViewResolver,
    RiderViewFinancialsResolver,
    RiderViewOrdersResolver,
    RiderViewAddresssesResolver
  ]
})
export class RiderViewRoutingModule { }
