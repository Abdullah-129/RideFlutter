import { DispatcherComponent } from './dispatcher.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RidersListResolver } from '../../riders/riders-list/riders-list.resolver';
import { DispatcherLocationsSelectComponent } from './dispatcher-locations-select/dispatcher-locations-select.component';
import { DispatcherLookingComponent } from './dispatcher-looking/dispatcher-looking.component';
import { DispatcherRidersListComponent } from './dispatcher-riders-list/dispatcher-riders-list.component';
import { DispatcherServiceSelectComponent } from './dispatcher-service-select/dispatcher-service-select.component';
import { DispatcherServiceSelectResolver } from './dispatcher-service-select/dispatcher-service-select.resolver';


const routes: Routes = [
  { path: '', component: DispatcherComponent, children: [
    { path: '', redirectTo: 'riders-list', pathMatch: 'full' },
    { path: 'riders-list', component: DispatcherRidersListComponent, resolve: { riders: RidersListResolver } },
    { path: 'locations-select', component: DispatcherLocationsSelectComponent },
    { path: 'service-select', component: DispatcherServiceSelectComponent, resolve: { services: DispatcherServiceSelectResolver }  }
  ] },
  { path: 'looking', component: DispatcherLookingComponent },
  //{ path: 'success/:id', component: DispatcherSuccessDriverInfoComponent },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RidersListResolver,
    DispatcherServiceSelectResolver
  ]
})
export class DispatcherRoutingModule { }
