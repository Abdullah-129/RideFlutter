import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ComplaintViewRoutingModule } from './complaint-view-routing.module';
import { ComplaintViewComponent } from './complaint-view.component';
import { ComplaintViewInfoComponent } from './complaint-view-info/complaint-view-info.component';
import { ComplaintViewRecordsComponent } from './complaint-view-records/complaint-view-records.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';


@NgModule({
  declarations: [ComplaintViewComponent, ComplaintViewInfoComponent, ComplaintViewRecordsComponent],
  imports: [
    CommonModule,
    ComplaintViewRoutingModule,
    SharedModule
  ]
})
export class ComplaintViewModule { }
