import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManagementPaymentGatewaysRoutingModule } from './management-payment-gateways-routing.module';
import { PaymentGatewaysListComponent } from './payment-gateways-list/payment-gateways-list.component';
import { PaymentGatewayViewComponent } from './payment-gateway-view/payment-gateway-view.component';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';


@NgModule({
  declarations: [PaymentGatewaysListComponent, PaymentGatewayViewComponent],
  imports: [
    CommonModule,
    ManagementPaymentGatewaysRoutingModule,
    SharedModule
  ],
  providers: [TagColorService]
})
export class ManagementPaymentGatewaysModule { }
