import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ServiceOptionViewComponent } from './service-option-view/service-option-view.component';
import { ServiceOptionViewResolver } from './service-option-view/service-option-view.resolver';
import { ServiceOptionsListComponent } from './service-options-list/service-options-list.component';
import { ServiceOptionsListResolver } from './service-options-list/service-options-list.resolver';


const routes: Routes = [
  { path: '', component: ServiceOptionsListComponent, resolve: { serviceOptions: ServiceOptionsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', component: ServiceOptionViewComponent, resolve: { serviceOption: ServiceOptionViewResolver } },
  { path: 'new', component: ServiceOptionViewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    ServiceOptionsListResolver,
    ServiceOptionViewResolver
  ]
})
export class ManagementServiceOptionsRoutingModule { }
