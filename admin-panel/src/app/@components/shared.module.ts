import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { IconsProviderModule } from '../icons-provider.module';
import { HttpClientModule } from '@angular/common/http';
import { GoogleMapsModule } from '@angular/google-maps';
import { TagColorService } from '../@services/tag-color/tag-color.service';
import { PhonePipe } from '../@pipes/phone.pipe';
import { TranslateModule } from '@ngx-translate/core';
import { NzButtonModule } from 'ng-zorro-antd/button';
import { NzCheckboxModule } from 'ng-zorro-antd/checkbox';
import { NzDropDownModule } from 'ng-zorro-antd/dropdown';
import { NzEmptyModule } from 'ng-zorro-antd/empty';
import { NzFormModule } from 'ng-zorro-antd/form';
import { NzGridModule } from 'ng-zorro-antd/grid';
import { NzIconModule } from 'ng-zorro-antd/icon';
import { NzInputModule } from 'ng-zorro-antd/input';
import { NzInputNumberModule } from 'ng-zorro-antd/input-number';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzModalService } from 'ng-zorro-antd/modal';
import { NzNotificationService } from 'ng-zorro-antd/notification';
import { NzRadioModule } from 'ng-zorro-antd/radio';
import { NzSelectModule } from 'ng-zorro-antd/select';
import { NzAlertModule } from 'ng-zorro-antd/alert';
import { NzTableModule } from 'ng-zorro-antd/table';
import { NzDividerModule } from 'ng-zorro-antd/divider';
import { NzDatePickerModule } from 'ng-zorro-antd/date-picker';
import { NzTimePickerModule } from 'ng-zorro-antd/time-picker';
import { NzTabsModule } from 'ng-zorro-antd/tabs';
import { NzTagModule } from 'ng-zorro-antd/tag';
import { NzPageHeaderModule } from 'ng-zorro-antd/page-header';
import { NzStatisticModule } from 'ng-zorro-antd/statistic';
import { NzDescriptionsModule } from 'ng-zorro-antd/descriptions';
import { NzUploadModule } from 'ng-zorro-antd/upload';
import { NzTransferModule } from 'ng-zorro-antd/transfer';
import { NzBadgeModule } from 'ng-zorro-antd/badge';
import { NzCommentModule } from 'ng-zorro-antd/comment';
import { NzAvatarModule } from 'ng-zorro-antd/avatar';
import { NzTimelineModule } from 'ng-zorro-antd/timeline';
import { NzCardModule } from 'ng-zorro-antd/card';
import { NzListModule } from 'ng-zorro-antd/list';
import { NzPopconfirmModule } from 'ng-zorro-antd/popconfirm';
import { NzPopoverModule } from 'ng-zorro-antd/popover';
import { NzStepsModule } from 'ng-zorro-antd/steps';
import { NzLayoutModule } from 'ng-zorro-antd/layout';
import { NzSwitchModule } from 'ng-zorro-antd/switch';
import { NzPaginationModule } from 'ng-zorro-antd/pagination';
import { NzRateModule } from 'ng-zorro-antd/rate';
import { NzResultModule } from 'ng-zorro-antd/result';
import { NzToolTipModule } from 'ng-zorro-antd/tooltip';
import { NzAutocompleteModule } from 'ng-zorro-antd/auto-complete';
import { NzSegmentedModule } from "ng-zorro-antd/segmented";
import { NzG2Module } from './g2';
import { TimeagoModule } from 'ngx-timeago';

@NgModule({
    imports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        NzAlertModule,
        NzTableModule,
        NzInputModule,
        NzDropDownModule,
        NzButtonModule,
        NzIconModule,
        NzFormModule,
        NzSelectModule,
        NzRadioModule,
        NzDividerModule,
        NzDatePickerModule,
        NzTimePickerModule,
        NzTabsModule,
        NzTagModule,
        NzPageHeaderModule,
        NzStatisticModule,
        NzDescriptionsModule,
        NzUploadModule,
        NzTransferModule,
        NzBadgeModule,
        NzCommentModule,
        NzAvatarModule,
        NzEmptyModule,
        NzTimelineModule,
        NzCardModule,
        NzListModule,
        NzToolTipModule,
        NzPopconfirmModule,
        NzPopoverModule,
        NzStepsModule,
        NzInputNumberModule,
        NzCheckboxModule,
        IconsProviderModule,
        HttpClientModule,
        NzLayoutModule,
        NzGridModule,
        GoogleMapsModule,
        NzSwitchModule,
        NzPaginationModule,
        NzRateModule,
        NzResultModule,
        TranslateModule,
        NzG2Module,
        TimeagoModule,
        NzAutocompleteModule,
        NzSegmentedModule
    ],
    exports: [
        CommonModule,
        FormsModule,
        ReactiveFormsModule,
        NzAlertModule,
        NzTableModule,
        NzInputModule,
        NzDropDownModule,
        NzButtonModule,
        NzIconModule,
        NzFormModule,
        NzSelectModule,
        NzRadioModule,
        NzDividerModule,
        NzDatePickerModule,
        NzTimePickerModule,
        NzTabsModule,
        NzTagModule,
        NzPageHeaderModule,
        NzStatisticModule,
        NzDescriptionsModule,
        NzUploadModule,
        NzTransferModule,
        NzBadgeModule,
        NzCommentModule,
        NzAvatarModule,
        NzEmptyModule,
        NzTimelineModule,
        NzCardModule,
        NzListModule,
        NzPopconfirmModule,
        NzPopoverModule,
        NzStepsModule,
        NzInputNumberModule,
        NzCheckboxModule,
        IconsProviderModule,
        HttpClientModule,
        NzLayoutModule,
        NzGridModule,
        GoogleMapsModule,
        NzSwitchModule,
        PhonePipe,
        NzPaginationModule,
        NzToolTipModule,
        NzRateModule,
        NzResultModule,
        TranslateModule,
        NzG2Module,
        TimeagoModule,
        NzAutocompleteModule,
        NzSegmentedModule
    ],
    declarations: [PhonePipe],
    providers: [NzNotificationService, NzMessageService, NzModalService, TagColorService]
})
export class SharedModule { }