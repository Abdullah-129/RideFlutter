import { NgModule } from '@angular/core';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';

import { AnnouncementViewComponent } from './announcement-view/announcement-view.component';
import { AnnouncementsListComponent } from './announcements-list/announcements-list.component';
import { AnnouncementsRoutingModule } from './announements-routing.module';


@NgModule({
  declarations: [AnnouncementsListComponent, AnnouncementViewComponent],
  imports: [
    AnnouncementsRoutingModule,
    SharedModule
  ]
})
export class AnnouncementsModule { }
