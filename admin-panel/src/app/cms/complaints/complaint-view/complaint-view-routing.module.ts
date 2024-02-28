import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ComplaintViewComponent } from './complaint-view.component';
import { ComplaintViewInfoComponent } from './complaint-view-info/complaint-view-info.component';
import { ComplaintViewRecordsComponent } from './complaint-view-records/complaint-view-records.component';
import { ComplaintViewResolver } from './complaint-view.resolver';

const routes: Routes = [
  { path: '', component: ComplaintViewComponent, resolve: { complaint: ComplaintViewResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange', children: [
    { path: '', redirectTo: 'info', pathMatch: 'full' },
    { path: 'info', component: ComplaintViewInfoComponent },
    { path: 'records', component: ComplaintViewRecordsComponent }
  ]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    ComplaintViewResolver
  ]
})
export class ComplaintViewRoutingModule { }
