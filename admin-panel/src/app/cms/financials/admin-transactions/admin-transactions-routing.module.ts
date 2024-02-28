import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminTransactionsComponent } from './admin-transactions.component';
import { ProviderWalletsListResolver } from './provider-transactions.resolver';

const routes: Routes = [
  { path: '', component: AdminTransactionsComponent, resolve: { providerWallet: ProviderWalletsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    ProviderWalletsListResolver
  ]
})
export class AdminTransactionsRoutingModule { }
