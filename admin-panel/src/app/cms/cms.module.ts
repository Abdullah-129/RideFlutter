import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CMSRoutingModule } from './cms-routing.module';
import { CMSComponent } from './cms.component';
import { SharedModule } from '../@components/shared.module';

@NgModule({
  declarations: [CMSComponent],
  imports: [
    CommonModule,
    CMSRoutingModule,
    SharedModule
  ],
})
export class CMSModule { }
