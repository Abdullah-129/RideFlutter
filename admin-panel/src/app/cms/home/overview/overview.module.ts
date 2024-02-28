import { NgModule } from '@angular/core';
import { OverviewRoutingModule } from './overview-routing.module';
import { OverviewComponent } from './overview.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';
import { OverviewDriversMapComponent } from './overview-drivers-map/overview-drivers-map.component';

@NgModule({
  declarations: [OverviewComponent, OverviewDriversMapComponent],
  imports: [
    OverviewRoutingModule,
    SharedModule
  ]
})
export class OverviewModule { }
