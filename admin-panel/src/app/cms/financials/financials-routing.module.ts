import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


const routes: Routes = [
  { path: '', redirectTo: 'provider', pathMatch: 'full' },
  { path: 'provider', loadChildren: () => import('./admin-transactions/admin-transactions.module').then(m => m.AdminTransactionsModule) },
  { path: 'fleet', loadChildren: () => import('./fleet-wallets/fleet-wallets.module').then(m => m.FleetWalletsModule) },
  { path: 'driver', loadChildren: () => import('./driver-wallets/driver-wallets.module').then(m => m.DriverWalletsModule) },
  { path: 'rider', loadChildren: () => import('./rider-wallets/rider-wallets.module').then(m => m.RiderWalletsModule) }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class FinancialsRoutingModule { }
