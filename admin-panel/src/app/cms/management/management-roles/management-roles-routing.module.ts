import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RoleViewComponent } from './role-view/role-view.component';
import { RoleViewResolver } from './role-view/roles-view.resolver';
import { RolesListComponent } from './roles-list/roles-list.component';
import { RolesListResolver } from './roles-list/roles-list.resolver';

const routes: Routes = [
  { path: '', component: RolesListComponent, resolve: {roles: RolesListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange'},
  { path: 'view/:id', component: RoleViewComponent, resolve: {role: RoleViewResolver } },
  { path: 'new', component: RoleViewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RolesListResolver,
    RoleViewResolver
  ]
})
export class ManagementRolesRoutingModule { }
