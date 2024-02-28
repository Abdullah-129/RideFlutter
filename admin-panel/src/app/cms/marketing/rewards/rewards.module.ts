import { NgModule } from '@angular/core';

import { RewardsRoutingModule } from './rewards-routing.module';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';
import { RewardViewComponent } from './reward-view/reward-view.component';
import { RewardListComponent } from './reward-list/reward-list.component';


@NgModule({
  declarations: [RewardListComponent, RewardViewComponent],
  imports: [
    RewardsRoutingModule,
    SharedModule
  ]
})
export class RewardsModule { }
