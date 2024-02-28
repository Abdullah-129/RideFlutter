import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ManagementCarsListComponent } from './management-cars-list/management-cars-list.component';
import { CarsListResolver } from './management-cars-list/management-cars-list.resolver';


const routes: Routes = [
  { path: '', component: ManagementCarsListComponent, resolve: { cars: CarsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    CarsListResolver
  ]
})
export class ManagementCarsRoutingModule { }
