import { Component, OnInit, ViewChild } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
  CreateServiceGQL,
  DeleteServiceGQL,
  NewServiceQuery,
  ServiceOptionIcon,
  ServicePaymentMethod,
  SetOptionsOnServiceGQL,
  SetRegionsOnServiceGQL,
  UpdateServiceGQL,
  ViewServiceQuery,
} from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { NzInputNumberComponent } from 'ng-zorro-antd/input-number';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzTimePickerComponent } from 'ng-zorro-antd/time-picker';
import { NzUploadFile } from 'ng-zorro-antd/upload';
import { firstValueFrom, Observable, Observer } from 'rxjs';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-management-services-view',
  templateUrl: './management-services-view.component.html',
  styles: [
    'nz-input-number{ @apply w-full }',
    'nz-time-picker{@apply w-full }',
  ],
})
export class ManagementServicesViewComponent implements OnInit {
  form = this.fb.group({
    id: [null],
    name: [null, Validators.required],
    description: [null],
    categoryId: [null, Validators.required],
    baseFare: [0, Validators.required],
    perHundredMeters: [0, Validators.required],
    perMinuteDrive: [0, Validators.required],
    perMinuteWait: [0, Validators.required],
    prepayPercent: [0, Validators.required],
    minimumFee: [0, Validators.required],
    roundingFactor: [null],
    searchRadius: [0, Validators.required],
    twoWayAvailable: [false, Validators.required],
    maximumDestinationDistance: [0, Validators.required],
    paymentMethod: ['CashCredit', Validators.required],
    cancellationTotalFee: [0, Validators.required],
    cancellationDriverShare: [0, Validators.required],
    providerSharePercent: [0, Validators.required],
    providerShareFlat: [0, Validators.required],
    personCapacity: [null],
    mediaId: [null, Validators.required],
    timeMultipliers: [[]],
    distanceMultipliers: [[]],
    regions: [[]],
    options: [[]],
  });
  root = environment.root;
  loadingUpload = false;
  query?:
    | Observable<ApolloQueryResult<ViewServiceQuery>>
    | Observable<ApolloQueryResult<NewServiceQuery>>;
  @ViewChild('timeStartPicker', { static: false })
  timeStartPicker!: NzTimePickerComponent;
  @ViewChild('timeEndPicker', { static: false })
  timeEndPicker!: NzTimePickerComponent;
  @ViewChild('timeMultiplyInput', { static: false })
  timeMultiplyInput!: NzInputNumberComponent;
  @ViewChild('distanceFromInput', { static: false })
  distanceFromInput!: NzInputNumberComponent;
  @ViewChild('distanceToInput', { static: false })
  distanceToInput!: NzInputNumberComponent;
  @ViewChild('distanceMultiplyInput', { static: false })
  distanceMultiplyInput!: NzInputNumberComponent;

  formatterPercent = (value: number) => `${value} %`;
  parserPercent = (value: string) => value.replace(' %', '');
  formatterMeters = (value: number) => `${value} m`;
  formatterPrice = (value: number) => `${value}`;
  parserMeters = (value: string) => value.replace(' m', '');
  jwt = localStorage.getItem('ridy_admin_token');
  avatarUrl?: string;
  paymentMethods = Object.values(ServicePaymentMethod);
  beforeUpload = (file: NzUploadFile, _fileList: NzUploadFile[]) =>
    new Observable((observer: Observer<boolean>) => {
      const isJpgOrPng =
        file.type === 'image/jpeg' || file.type === 'image/png';
      if (!isJpgOrPng) {
        this.msg.error('You can only upload JPG file!');
        observer.complete();
        return;
      }
      const isLt2M = (file.size ?? 0) / 1024 / 1024 < 2;
      if (!isLt2M) {
        this.msg.error('Image must smaller than 2MB!');
        observer.complete();
        return;
      }
      observer.next(isJpgOrPng && isLt2M);
      observer.complete();
    });

  constructor(
    private route: ActivatedRoute,
    private fb: UntypedFormBuilder,
    private updateGQL: UpdateServiceGQL,
    private createGQL: CreateServiceGQL,
    private setRegionsGQL: SetRegionsOnServiceGQL,
    private setOptionsGQL: SetOptionsOnServiceGQL,
    private deleteGql: DeleteServiceGQL,
    private msg: NzMessageService,
    private routerHelper: RouterHelperService
  ) {}

  ngOnInit(): void {
    this.query = this.route.data.pipe(map((data) => data.service));
    this.route.data.subscribe((data) => {
      const service: ViewServiceQuery['service'] = data.service.data.service;
      if (service == null) return;
      if (service.regions.length > 0) {
        const currency = service.regions[0].currency;
        this.formatterPrice = (value: any) =>
          value == null ? '' : `${value} ${currency}`;
      }
      service.regions = service.regions.map(
        (region: { id: string }) => region.id
      ) as unknown as any;
      service.options = service.options.map(
        (region: { id: string }) => region.id
      ) as unknown as any;
      this.form.patchValue(service);
      this.avatarUrl = service.media.address;
    });
  }

  async onSubmit() {
    const { id, regions, options, ...input } = this.form.value;
    console.log(input);
    if (regions.length < 1) {
      this.msg.error(
        'Select at least one region which this service can be ordered from.'
      );
      return;
    }
    let resId = id;
    if (input.roundingFactor == '') input.roundingFactor = null;
    try {
      if (id == null) {
        const result = await firstValueFrom(this.createGQL.mutate({ input }));
        resId = result.data?.createOneService.id;
      } else {
        const result = await firstValueFrom(
          this.updateGQL.mutate({ id, input })
        );
        resId = result.data?.updateOneService.id;
      }

      await firstValueFrom(
        this.setRegionsGQL.mutate({ id: resId, relationIds: regions })
      );
      await firstValueFrom(
        this.setOptionsGQL.mutate({ id: resId, relationIds: options })
      );
      this.routerHelper.goToParent(this.route);
    } catch (error: any) {
      console.log(error);
      this.msg.error(error.message);
    }
  }

  insertTimeRule() {
    if (this.form.value.timeMultipliers == null) {
      this.form.value.timeMultipliers = [];
    }
    this.form.value.timeMultipliers.push({
      startTime: this.timeStartPicker.inputRef.nativeElement.value,
      endTime: this.timeEndPicker.inputRef.nativeElement.value,
      multiply: parseFloat(
        this.timeMultiplyInput.inputElement.nativeElement.value
      ),
    });
  }

  removeTimeRule(_rule: TimeMultiplier) {
    this.form.value.timeMultipliers = this.form.value.timeMultipliers.filter(
      (rule: any) => rule != _rule
    );
  }

  insertDistanceRule() {
    if (this.form.value.distanceMultipliers == null) {
      this.form.value.distanceMultipliers = [];
    }
    this.form.value.distanceMultipliers.push({
      distanceFrom: parseInt(
        this.distanceFromInput.inputElement.nativeElement.value
      ),
      distanceTo: parseInt(
        this.distanceToInput.inputElement.nativeElement.value
      ),
      multiply: parseFloat(
        this.distanceMultiplyInput.inputElement.nativeElement.value
      ),
    });
  }

  removeDistanceRule(_rule: DistanceMultiplier) {
    const distanceMultipliers = this.form.value.distanceMultipliers.filter(
      (rule: any) => rule != _rule
    );
    this.form.patchValue({ distanceMultipliers });
  }

  handleRegionCheckChange(
    checked: boolean,
    region: { id: string; currency: string }
  ) {
    if (checked) {
      this.formatterPrice = (value: any) =>
        value == null ? '' : `${value} ${region.currency}`;
      if (this.form.value.regions.indexOf(region.id) < 0) {
        this.form.value.regions.push(region.id);
      }
    } else {
      this.form.value.regions = this.form.value.regions.filter(
        (_region: string) => _region != region.id
      );
    }
  }

  handleUploadChange(event: { file: NzUploadFile }) {
    switch (event.file.status) {
      case 'uploading':
        this.loadingUpload = true;
        break;
      case 'done':
        this.loadingUpload = false;
        this.form.patchValue({ mediaId: event.file.response.id });
        this.avatarUrl = event.file.response.address;
        break;
      case 'error':
        this.msg.error('Network error');
        this.loadingUpload = false;
        break;
    }
  }

  async deleteService() {
    const id = this.form.value.id;
    try {
      await firstValueFrom(this.deleteGql.mutate({ id }));
      this.msg.success('Delete was successful.');
      this.routerHelper.goToParent(this.route);
    } catch (error: any) {
      this.msg.error(error.message);
    }
  }

  onItemChecked(id: string, checked: boolean): void {
    if (checked) {
      if (this.form.value.options.indexOf(id) < 0) {
        this.form.value.options.push(id);
      }
    } else {
      this.form.value.options = this.form.value.options.filter(
        (_region: string) => _region != id
      );
    }
  }
}

export interface TimeMultiplier {
  startTime: string;
  endTime: string;
  multiply: number;
}

export interface DistanceMultiplier {
  distanceFrom: number;
  distanceTo: number;
  multiply: number;
}
