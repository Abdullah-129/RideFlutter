import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { DriverProfileDetailsComponent } from './driver-profile-details/driver-profile-details.component';
import { DriverProfileDocumentsComponent } from './driver-profile-documents/driver-profile-documents.component';
import { DriverProfileFeedbacksComponent } from './driver-profile-feedbacks/driver-profile-feedbacks.component';
import { DriverProfileFeedbacksResolver } from './driver-profile-feedbacks/driver-profile-feedbacks.resolver';
import { DriverProfileFinancialComponent } from './driver-profile-financial/driver-profile-financial.component';
import { DriverProfileFinancialsResolver } from './driver-profile-financial/driver-profile-financial.resolver';
import { DriverProfileOrdersComponent } from './driver-profile-orders/driver-profile-orders.component';
import { DriverProfileOrdersResolver } from './driver-profile-orders/driver-profile-orders.resolver';
import { DriverProfileComponent } from './driver-profile.component';
import { DriverProfileResolver } from './driver-profile.resolver';

const routes: Routes = [
  {
    path: '', component: DriverProfileComponent, resolve: { driver: DriverProfileResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange', children: [
      { path: '', redirectTo: 'details', pathMatch: 'full' },
      { path: 'details', component: DriverProfileDetailsComponent },
      { path: 'orders', component: DriverProfileOrdersComponent, resolve: { orders: DriverProfileOrdersResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
      { path: 'financial', component: DriverProfileFinancialComponent, resolve: { financials: DriverProfileFinancialsResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
      { path: 'reviews', component: DriverProfileFeedbacksComponent, resolve: {feedbacks: DriverProfileFeedbacksResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
      { path: 'documents', component: DriverProfileDocumentsComponent }

    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    DriverProfileResolver,
    DriverProfileFinancialsResolver,
    DriverProfileFeedbacksResolver,
    DriverProfileOrdersResolver
  ]
})
export class DriverProfileRoutingModule { }
