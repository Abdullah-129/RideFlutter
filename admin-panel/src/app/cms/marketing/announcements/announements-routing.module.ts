import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AnnouncementViewComponent } from './announcement-view/announcement-view.component';
import { AnnouncementViewResolver } from './announcement-view/announcement-view.resolver';
import { AnnouncementsListComponent } from './announcements-list/announcements-list.component';
import { AnnouncementsListResolver } from './announcements-list/announcements-list.resolver';


const routes: Routes = [
  { path: '', component: AnnouncementsListComponent, resolve: {announcements: AnnouncementsListResolver} , runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', component: AnnouncementViewComponent, resolve: { announcement: AnnouncementViewResolver } },
  { path: 'new', component: AnnouncementViewComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    AnnouncementsListResolver,
    AnnouncementViewResolver
  ]
})
export class AnnouncementsRoutingModule { }
