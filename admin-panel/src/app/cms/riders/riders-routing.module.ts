import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RiderNewComponent } from './rider-new/rider-new.component';
import { RidersListComponent } from './riders-list/riders-list.component';
import { RidersListResolver } from './riders-list/riders-list.resolver';


const routes: Routes = [
  { path: '', component: RidersListComponent, resolve: { riders: RidersListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', loadChildren: () => import('./rider-view/rider-view.module').then(m => m.RiderViewModule) },
  { path: 'new', component: RiderNewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RidersListResolver
  ]
})
export class RidersRoutingModule { }
