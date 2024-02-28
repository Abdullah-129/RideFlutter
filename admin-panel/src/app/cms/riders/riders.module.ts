import { NgModule } from '@angular/core';

import { SharedModule } from '../../@components/shared.module';
import { RiderNewComponent } from './rider-new/rider-new.component';
import { RidersListComponent } from './riders-list/riders-list.component';
import { RidersRoutingModule } from './riders-routing.module';


@NgModule({
  declarations: [RidersListComponent, RiderNewComponent],
  imports: [
    RidersRoutingModule,
    SharedModule
  ],
  providers: []
})
export class RidersModule { }
