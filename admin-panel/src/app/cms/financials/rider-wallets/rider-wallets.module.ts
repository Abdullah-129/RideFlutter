import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RiderWalletsRoutingModule } from './rider-wallets-routing.module';
import { RiderWalletsListComponent } from './rider-wallets-list.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';


@NgModule({
  declarations: [RiderWalletsListComponent],
  imports: [
    CommonModule,
    RiderWalletsRoutingModule,
    SharedModule
  ]
})
export class RiderWalletsModule { }
