import { NgModule } from '@angular/core';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';
import { RequestViewActivitiesComponent } from './request-view-activities/request-view-activities.component';

import { RequestViewChatsComponent } from './request-view-chats/request-view-chats.component';
import { RequestViewComplaintsComponent } from './request-view-complaints/request-view-complaints.component';
import { RequestViewFinancialsComponent } from './request-view-financials/request-view-financials.component';
import { RequestViewInfoComponent } from './request-view-info/request-view-info.component';
import { RequestViewRoutingModule } from './request-view-routing.module';
import { RequestViewComponent } from './request-view.component';
import { RequestViewAssignComponent } from './request-view-assign/request-view-assign.component';

@NgModule({
  declarations: [
    RequestViewComponent,
    RequestViewInfoComponent,
    RequestViewComplaintsComponent,
    RequestViewFinancialsComponent,
    RequestViewChatsComponent,
    RequestViewActivitiesComponent,
    
    RequestViewAssignComponent,
  ],
  imports: [RequestViewRoutingModule, SharedModule]
})
export class RequestViewModule {}
