import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ReviewParametersListComponent } from './review-parameters-list/review-parameters-list.component';
import { ReviewParametersListResolver } from './review-parameters-list/review-parameters-list.resolver';
import { ReviewParameterViewComponent } from './review-parameter-view/review-parameter-view.component';
import { ReviewParameterViewResolver } from './review-parameter-view/review-parameter-view.resolver';


const routes: Routes = [
  { path: '', component: ReviewParametersListComponent, resolve: { reviewParameters: ReviewParametersListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', component: ReviewParameterViewComponent, resolve: { reviewParameter: ReviewParameterViewResolver } },
  { path: 'new', component: ReviewParameterViewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    ReviewParametersListResolver,
    ReviewParameterViewResolver
  ]
})
export class ManagementReviewParametersRoutingModule { }
