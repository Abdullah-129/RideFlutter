import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  { path: '', redirectTo: 'settings', pathMatch: 'full' },
  {
    path: 'regions',
    loadChildren: () =>
      import('./management-region/management-region.module').then(
        (x) => x.ManagementRegionModule
      ),
  },
  {
    path: 'services',
    loadChildren: () =>
      import('./management-services/management-services.module').then(
        (x) => x.ManagementServicesModule
      ),
  },
  {
    path: 'service-options',
    loadChildren: () =>
      import(
        './management-service-options/management-service-options.module'
      ).then((x) => x.ManagementServiceOptionsModule),
  },
  {
    path: 'review-parameters',
    loadChildren: () =>
      import(
        './management-review-parameters/management-review-parameters.module'
      ).then((x) => x.ManagementReviewParametersModule),
  },
  {
    path: 'fleets',
    loadChildren: () =>
      import('./management-fleets/management-fleets.module').then(
        (x) => x.ManagementFleetsModule
      ),
  },
  {
    path: 'zone-prices',
    loadChildren: () =>
      import('./management-zone-prices/management-zone-prices.module').then(
        (x) => x.ManagementZonePricesModule
      ),
  },
  {
    path: 'cars',
    loadChildren: () =>
      import('./management-cars/management-cars.module').then(
        (x) => x.ManagementCarsModule
      ),
  },
  {
    path: 'payment-gateways',
    loadChildren: () =>
      import(
        './management-payment-gateways/management-payment-gateways.module'
      ).then((x) => x.ManagementPaymentGatewaysModule),
  },
  {
    path: 'users',
    loadChildren: () =>
      import('./management-users/management-users.module').then(
        (x) => x.ManagementUsersModule
      ),
  },
  {
    path: 'user-roles',
    loadChildren: () =>
      import('./management-roles/management-roles.module').then(
        (x) => x.ManagementRolesModule
      ),
  },
  {
    path: 'settings',
    loadChildren: () =>
      import('./management-settings/management-settings.module').then(
        (x) => x.ManagementSettingsModule
      ),
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class ManagementRoutingModule {}
