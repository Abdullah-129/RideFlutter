import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ManagementServicesListComponent } from './management-services-list/management-services-list.component';
import { ManagementServicesViewComponent } from './management-services-view/management-services-view.component';
import { ManagementServiceCategoryViewComponent } from './management-service-category-view/management-service-category-view.component';
import { ServicesListResolver } from './management-services-list/management-services-list.rsolver';
import { ManagementServicesViewResolver } from './management-services-view/management-service-view.resolver';
import { ManagementServicesCategoryViewResolver } from './management-service-category-view/management-service-category-view.resolver';
import { ManagementServiceNewResolver } from './management-services-view/management-service-new.resolver';


const routes: Routes = [
  { path: '', component: ManagementServicesListComponent, resolve: { services: ServicesListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', component: ManagementServicesViewComponent, resolve: { service: ManagementServicesViewResolver } },
  { path: 'new', component: ManagementServicesViewComponent, resolve: { service: ManagementServiceNewResolver } },
  { path: 'category/view/:id', component: ManagementServiceCategoryViewComponent, resolve: { serviceCategory: ManagementServicesCategoryViewResolver } },
  { path: 'category/new', component: ManagementServiceCategoryViewComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    ServicesListResolver,
    ManagementServicesViewResolver,
    ManagementServiceNewResolver,
    ManagementServicesCategoryViewResolver
  ]
})
export class ManagementServicesRoutingModule { }
