import { SharedModule } from './../../../@components/shared.module';
import { DispatcherRoutingModule } from './dispatcher-routing.module';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DispatcherComponent } from './dispatcher.component';
import { GooglePlacesComponent } from '@ridy/admin-panel/src/app/@components/google-places.component';
import { DispatcherRidersListComponent } from './dispatcher-riders-list/dispatcher-riders-list.component';
import { DispatcherLocationsSelectComponent } from './dispatcher-locations-select/dispatcher-locations-select.component';
import { DispatcherServiceSelectComponent } from './dispatcher-service-select/dispatcher-service-select.component';
import { DispatcherLookingComponent } from './dispatcher-looking/dispatcher-looking.component';
import { DispatcherSuccessDriverInfoComponent } from './dispatcher-success-driver-info/dispatcher-success-driver-info.component';
import { DispatcherService } from './dispatcher.service';



@NgModule({
  declarations: [DispatcherComponent, GooglePlacesComponent, DispatcherRidersListComponent, DispatcherLocationsSelectComponent, DispatcherServiceSelectComponent, DispatcherLookingComponent, DispatcherSuccessDriverInfoComponent],
  imports: [
    CommonModule,
    DispatcherRoutingModule,
    SharedModule
  ],
  providers: [DispatcherService]
})
export class DispatcherModule { }
