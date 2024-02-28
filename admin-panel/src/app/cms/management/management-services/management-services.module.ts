import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ManagementServicesRoutingModule } from './management-services-routing.module';
import { ManagementServicesListComponent } from './management-services-list/management-services-list.component';
import { ManagementServicesViewComponent } from './management-services-view/management-services-view.component';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { ManagementServiceCategoryViewComponent } from './management-service-category-view/management-service-category-view.component';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';


@NgModule({
  declarations: [ManagementServicesListComponent, ManagementServicesViewComponent, ManagementServiceCategoryViewComponent],
  imports: [
    ManagementServicesRoutingModule,
    SharedModule
  ],
  providers: [TagColorService]
})
export class ManagementServicesModule { }
