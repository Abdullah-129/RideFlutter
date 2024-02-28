import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SOSViewComponent } from './sos-view.component';
import { SOSViewInfoComponent } from './sos-view-info/sos-view-info.component';
import { SOSViewResolver } from './sos-view.resolver';

const routes: Routes = [
  { path: '', component: SOSViewComponent, resolve: { sos: SOSViewResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange', children: [
    { path: '', redirectTo: 'info', pathMatch: 'full' },
    { path: 'info', component: SOSViewInfoComponent },
  ]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    SOSViewResolver
  ]
})
export class SOSViewRoutingModule { }
