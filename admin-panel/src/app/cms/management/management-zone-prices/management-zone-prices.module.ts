import { NgModule } from '@angular/core';
import { ManagementZonePricesRoutingModule } from './management-zone-prices-routing.module';
import { ZonePricesListComponent } from './zone-prices-list/zone-prices-list.component';
import { ZonePriceViewComponent } from './zone-price-view/zone-price-view.component';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { SharedModule } from '@ridy/admin-panel/src/app/@components/shared.module';
2920;
@NgModule({
  declarations: [ZonePricesListComponent, ZonePriceViewComponent],
  imports: [ManagementZonePricesRoutingModule, SharedModule],
  providers: [TagColorService],
})
export class ManagementZonePricesModule {}
