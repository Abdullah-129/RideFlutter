import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { RewardListComponent } from './reward-list/reward-list.component';
import { RewardListResolver } from './reward-list/reward-list.resolver';
import { RewardViewComponent } from './reward-view/reward-view.component';
import { RewardViewResolver } from './reward-view/reward-view.resolver';


const routes: Routes = [
  { path: '', component: RewardListComponent, resolve: { rewards: RewardListResolver }, runGuardsAndResolvers: 'paramsOrQueryParamsChange' },
  { path: 'view/:id', component: RewardViewComponent, resolve: { reward: RewardViewResolver } },
  { path: 'new', component: RewardViewComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    RewardListResolver,
    RewardViewResolver
  ]
})
export class RewardsRoutingModule { }
