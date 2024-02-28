import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FleetNewComponent } from './fleet-new/fleet-new.component';
import { FleetsListComponent } from './fleets-list/fleets-list.component';
import { FleetsListResolver } from './fleets-list/fleets-list.resolver';


const routes: Routes = [
  { path: '', component: FleetsListComponent, resolve: { fleets: FleetsListResolver } },
  { path: 'view/:id', loadChildren: () => import('./fleet-view/fleet-view.module').then(m => m.FleetViewModule) },
  { path: 'new', component: FleetNewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    FleetsListResolver
  ]
})
export class ManagementFleetsRoutingModule { }
