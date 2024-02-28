import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { FleetViewRoutingModule } from './fleet-view-routing.module';
import { FleetViewDetailsComponent } from './fleet-view-details/fleet-view-details.component';
import { FleetViewFinancialsComponent } from './fleet-view-financials/fleet-view-financials.component';
import { FleetViewComponent } from './fleet-view.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';
import { FleetViewZonePricesComponent } from './fleet-view-zone-prices/fleet-view-zone-prices.component';

@NgModule({
  declarations: [
    FleetViewComponent,
    FleetViewDetailsComponent,
    FleetViewFinancialsComponent,
    FleetViewZonePricesComponent,
  ],
  imports: [FleetViewRoutingModule, SharedModule],
  providers: [],
})
export class FleetViewModule {}
