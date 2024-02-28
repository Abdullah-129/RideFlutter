import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { ComplaintsListComponent } from './complaints-list/complaints-list.component';
import { ComplaintsListResolver } from './complaints-list/complaints-list.resolver';

const routes: Routes = [
  { path: '', component: ComplaintsListComponent, resolve: { complaints: ComplaintsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', loadChildren: () => import('./complaint-view/complaint-view.module').then(m => m.ComplaintViewModule) }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    ComplaintsListResolver
  ]
})
export class ComplaintsRoutingModule { }
