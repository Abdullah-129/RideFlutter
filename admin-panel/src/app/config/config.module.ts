import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ConfigComponent } from './config.component';
import { NzModalService } from 'ng-zorro-antd/modal';
import { ConfigRoutingModule } from './config-routing.module';
import { SharedModule } from '../@components/shared.module';



@NgModule({
  declarations: [ConfigComponent],
  imports: [
    CommonModule,
    ConfigRoutingModule,
    SharedModule,
  ],
  providers: [NzModalService]
})
export class ConfigModule { }
