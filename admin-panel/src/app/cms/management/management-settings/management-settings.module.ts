import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManagementSettingsRoutingModule } from './management-settings-routing.module';
import { ManagementSettingsComponent } from './management-settings.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';


@NgModule({
  declarations: [ManagementSettingsComponent],
  imports: [
    CommonModule,
    ManagementSettingsRoutingModule,
    SharedModule
  ]
})
export class ManagementSettingsModule { }
