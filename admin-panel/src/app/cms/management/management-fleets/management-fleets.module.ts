import { NgModule } from '@angular/core';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';

import { FleetNewComponent } from './fleet-new/fleet-new.component';
import { FleetsListComponent } from './fleets-list/fleets-list.component';
import { ManagementFleetsRoutingModule } from './management-fleets-routing.module';


@NgModule({
  declarations: [FleetsListComponent, FleetNewComponent],
  imports: [
    ManagementFleetsRoutingModule,
    SharedModule
  ]
})
export class ManagementFleetsModule { }
