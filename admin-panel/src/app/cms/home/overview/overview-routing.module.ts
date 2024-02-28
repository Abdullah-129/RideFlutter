import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OverviewComponent } from './overview.component';
import { OverviewResolver } from './overview.resolver';


const routes: Routes = [
  { path: '', component: OverviewComponent, resolve: {overview: OverviewResolver} }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    OverviewResolver
  ]
})
export class OverviewRoutingModule { }
