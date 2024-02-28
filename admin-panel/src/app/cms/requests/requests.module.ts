import { NgModule } from '@angular/core';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';

import { RequestsListComponent } from './requests-list/requests-list.component';
import { RequestsRoutingModule } from './requests-routing.module';


@NgModule({
  declarations: [RequestsListComponent],
  imports: [
    RequestsRoutingModule,
    SharedModule,
  ]
})
export class RequestsModule { }
