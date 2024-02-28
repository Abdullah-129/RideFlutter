import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OrderViewResolver } from './request-view/order-view.resolver';
import { OrdersListResolver } from './requests-list/orders-list.resolver';
import { RequestsListComponent } from './requests-list/requests-list.component';


const routes: Routes = [
  { path: '', component: RequestsListComponent, resolve: { orders: OrdersListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', loadChildren: () => import('./request-view/request-view.module').then(m => m.RequestViewModule) }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    OrdersListResolver,
    OrderViewResolver
  ]
})
export class RequestsRoutingModule { }
