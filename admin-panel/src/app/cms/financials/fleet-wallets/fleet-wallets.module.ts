import { NgModule } from '@angular/core';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';

import { FleetWalletsListComponent } from './fleet-wallets-list.component';
import { FleetWalletsRoutingModule } from './fleet-wallets-routing.module';


@NgModule({
  declarations: [FleetWalletsListComponent],
  imports: [
    FleetWalletsRoutingModule,
    SharedModule
  ]
})
export class FleetWalletsModule { }
