import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RiderWalletsListComponent } from './rider-wallets-list.component';
import { RiderWalletsListResolver } from './rider-wallets-list.resolver';


const routes: Routes = [
  { path: '', component: RiderWalletsListComponent, resolve: { riderWallet: RiderWalletsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RiderWalletsListResolver
  ]
})
export class RiderWalletsRoutingModule { }
