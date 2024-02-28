import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';

import { DriverProfileDetailsComponent } from './driver-profile-details/driver-profile-details.component';
import { DriverProfileDocumentsComponent } from './driver-profile-documents/driver-profile-documents.component';
import { DriverProfileFeedbacksComponent } from './driver-profile-feedbacks/driver-profile-feedbacks.component';
import { DriverProfileFinancialComponent } from './driver-profile-financial/driver-profile-financial.component';
import { DriverProfileOrdersComponent } from './driver-profile-orders/driver-profile-orders.component';
import { DriverProfileRoutingModule } from './driver-profile-routing.module';
import { DriverProfileComponent } from './driver-profile.component';


@NgModule({
  declarations: [DriverProfileComponent, DriverProfileDetailsComponent, DriverProfileFinancialComponent, DriverProfileFeedbacksComponent, DriverProfileDocumentsComponent, DriverProfileOrdersComponent],
  imports: [
    DriverProfileRoutingModule,
    SharedModule
  ]
})
export class DriverProfileModule { }
