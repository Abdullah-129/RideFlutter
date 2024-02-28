import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ZonePriceNewResolver } from './zone-price-view/zone-price-new.resolver';
import { ZonePriceViewComponent } from './zone-price-view/zone-price-view.component';
import { ZonePriceViewResolver } from './zone-price-view/zone-price-view.resolver';
import { ZonePricesListComponent } from './zone-prices-list/zone-prices-list.component';
import { ZonePricesListResolver } from './zone-prices-list/zone-prices-list.resolver';

const routes: Routes = [
  {
    path: '',
    component: ZonePricesListComponent,
    resolve: { zonePrices: ZonePricesListResolver },
    runGuardsAndResolvers: 'paramsOrQueryParamsChange',
  },
  {
    path: 'view/:id',
    component: ZonePriceViewComponent,
    resolve: { zonePrice: ZonePriceViewResolver },
  },
  {
    path: 'new',
    component: ZonePriceViewComponent,
    resolve: { zonePrice: ZonePriceNewResolver },
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    ZonePriceViewResolver,
    ZonePricesListResolver,
    ZonePriceNewResolver,
  ],
})
export class ManagementZonePricesRoutingModule {}
