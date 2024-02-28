import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { DriverWalletsListComponent } from './driver-wallets-list.component';
import { DriverWalletsListResolver } from './driver-wallets-list.resolver';


const routes: Routes = [
  { path: '', component: DriverWalletsListComponent, resolve: { driverWallet: DriverWalletsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    DriverWalletsListResolver
  ]
})
export class DriverWalletsRoutingModule { }
