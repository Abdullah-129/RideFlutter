import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CMSComponent } from './cms.component';


const routes: Routes = [
  {
    path: '',
    component: CMSComponent,
    children: [
      { path: '', pathMatch: 'full', redirectTo: 'home' },
      {
        path: 'home', children: [
          { path: '', redirectTo: 'overview', pathMatch: 'full' },
          { path: 'overview', loadChildren: () => import('./home/overview/overview.module').then(m => m.OverviewModule) },
          { path: 'dispatcher', loadChildren: () => import('./home/dispatcher/dispatcher.module').then(m => m.DispatcherModule) }
        ]
      },
      { path: 'drivers', loadChildren: () => import('./drivers/drivers.module').then(m => m.DriversModule) },
      { path: 'riders', loadChildren: () => import('./riders/riders.module').then(m => m.RidersModule) },
      { path: 'marketing', loadChildren: () => import('./marketing/marketing.module').then(m => m.MarketingModule) },
      { path: 'financials', loadChildren: () => import('./financials/financials.module').then(m => m.FinancialsModule) },
      { path: 'requests', loadChildren: () => import('./requests/requests.module').then(m => m.RequestsModule) },
      { path: 'complaints', loadChildren: () => import('./complaints/complaints.module').then(m => m.ComplaintsModule) },
      { path: 'sos', loadChildren: () => import('./sos/sos.module').then(m => m.SOSModule) },
      { path: 'management', loadChildren: () => import('./management/management.module').then(x => x.ManagementModule) }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CMSRoutingModule { }
