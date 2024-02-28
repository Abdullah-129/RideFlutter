import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { OrderViewResolver } from './order-view.resolver';
import { RequestViewActivitiesComponent } from './request-view-activities/request-view-activities.component';
import { RequestViewAssignComponent } from './request-view-assign/request-view-assign.component';
import { RequestViewAssignResolver } from './request-view-assign/request-view-assign.resolver';
import { RequestViewChatsComponent } from './request-view-chats/request-view-chats.component';
import { RequestViewComplaintsComponent } from './request-view-complaints/request-view-complaints.component';
import { RequestViewFinancialsComponent } from './request-view-financials/request-view-financials.component';
import { RequestViewInfoComponent } from './request-view-info/request-view-info.component';
import { RequestViewComponent } from './request-view.component';


const routes: Routes = [
  {
    path: '', component: RequestViewComponent, resolve: { order: OrderViewResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange', children: [
      { path: '', redirectTo: 'info', pathMatch: 'full' },
      { path: 'info', component: RequestViewInfoComponent },
      { path: 'activities', component: RequestViewActivitiesComponent },
      { path: 'complaints', component: RequestViewComplaintsComponent },
      { path: 'financials', component: RequestViewFinancialsComponent },
      { path: 'chats', component: RequestViewChatsComponent },
      { path: 'assign', component: RequestViewAssignComponent, resolve: { availableDrivers: RequestViewAssignResolver } },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RequestViewAssignResolver
  ]
})
export class RequestViewRoutingModule { }
