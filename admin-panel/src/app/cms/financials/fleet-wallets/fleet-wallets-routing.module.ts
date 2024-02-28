import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FleetWalletsListComponent } from './fleet-wallets-list.component';
import { FleetWalletsListResolver } from './fleet-wallets-list.resolver';


const routes: Routes = [
  { path: '', component: FleetWalletsListComponent, resolve: { fleetWallet: FleetWalletsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' }

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    FleetWalletsListResolver
  ]
})
export class FleetWalletsRoutingModule { }
