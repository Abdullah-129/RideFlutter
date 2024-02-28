import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { SOSListComponent } from './sos-list/sos-list.component';
import { SOSListResolver } from './sos-list/sos-list.resolver';

const routes: Routes = [
  { path: '', component: SOSListComponent, resolve: { sos: SOSListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', loadChildren: () => import('./sos-view/sos-view.module').then(m => m.SOSViewModule) }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    SOSListResolver
  ]
})
export class SOSRoutingModule { }
