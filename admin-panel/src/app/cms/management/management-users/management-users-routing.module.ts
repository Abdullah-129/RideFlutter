import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { OperatorNewComponent } from './operator-new/operator-new.component';
import { OperatorNewResolver } from './operator-new/operator-new.resolver';

import { UsersListComponent } from './users-list/users-list.component';
import { UsersListResolver } from './users-list/users-list.resolver';


const routes: Routes = [
  { path: '', component: UsersListComponent, resolve: { operators: UsersListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', loadChildren: () => import('./user-view/user-view.module').then(m => m.UserViewModule) },
  { path: 'new', component: OperatorNewComponent, resolve: {operator: OperatorNewResolver} }
  //{ path: 'view/:id', component: UserViewComponent, resolve: { item: ItemResolver }, data: {table: 'Operator'} },
  //{ path: 'new', component: UserViewComponent, resolve: { item: ItemResolver }, data: {table: 'Operator'} }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    UsersListResolver,
    OperatorNewResolver
  ]
})
export class ManagementUsersRoutingModule { }
