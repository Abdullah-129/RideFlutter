import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DriverNewComponent } from './driver-new/driver-new.component';
import { DriversListComponent } from './drivers-list/drivers-list.component';
import { DriversListResolver } from './drivers-list/drivers-list.resolver';

const routes: Routes = [
  { path: '', component: DriversListComponent, resolve: {drivers: DriversListResolver}, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', loadChildren: () => import('./driver-profile/driver-profile.module').then(m => m.DriverProfileModule)},
  { path: 'new', component: DriverNewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    DriversListResolver
  ]
})
export class DriversRoutingModule { }
