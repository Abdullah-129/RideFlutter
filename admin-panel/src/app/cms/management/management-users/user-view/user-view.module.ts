import { NgModule } from '@angular/core';

import { UserViewRoutingModule } from './user-view-routing.module';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';
import { UserViewDetailsComponent } from './user-view-details/user-view-details.component';
import { UserViewComponent } from './user-view.component';
import { OperatorNewComponent } from '../operator-new/operator-new.component';


@NgModule({
  declarations: [UserViewComponent, UserViewDetailsComponent, OperatorNewComponent],
  imports: [
    SharedModule,
    UserViewRoutingModule
  ]
})
export class UserViewModule { }
