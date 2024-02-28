import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegionListComponent } from './region-list/region-list.component';
import { RegionsListResolver } from './region-list/region-list.resolver';
import { RegionViewComponent } from './region-view/region-view.component';
import { RegionViewResolver } from './region-view/region-view.resolver';


const routes: Routes = [
  { path: '', component: RegionListComponent, resolve: { regions: RegionsListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', component: RegionViewComponent, resolve: { region: RegionViewResolver } },
  { path: 'new', component: RegionViewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RegionsListResolver,
    RegionViewResolver
  ]
})
export class ManagementRegionRoutingModule { }
