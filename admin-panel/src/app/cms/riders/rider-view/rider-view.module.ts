import { NgModule } from '@angular/core';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';
import { RiderViewAddressesComponent } from './rider-view-addresses/rider-view-addresses.component';

import { RiderViewFinancialsComponent } from './rider-view-financials/rider-view-financials.component';
import { RiderViewInfoComponent } from './rider-view-info/rider-view-info.component';
import { RiderViewOrdersComponent } from './rider-view-orders/rider-view-orders.component';
import { RiderViewRoutingModule } from './rider-view-routing.module';
import { RiderViewComponent } from './rider-view.component';

@NgModule({
  declarations: [RiderViewComponent, RiderViewInfoComponent, RiderViewFinancialsComponent, RiderViewOrdersComponent, RiderViewAddressesComponent ],
  imports: [
    RiderViewRoutingModule,
    SharedModule
  ]
})
export class RiderViewModule { }
