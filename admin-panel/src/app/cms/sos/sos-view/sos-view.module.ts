import { NgModule } from '@angular/core';
import { SOSViewRoutingModule } from './sos-view-routing.module';
import { SOSViewComponent } from './sos-view.component';
import { SOSViewInfoComponent } from './sos-view-info/sos-view-info.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';


@NgModule({
  declarations: [SOSViewComponent, SOSViewInfoComponent],
  imports: [
    SOSViewRoutingModule,
    SharedModule
  ]
})
export class SOSViewModule { }
