import { Component, OnDestroy, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { Gender, UpdateDriverProfileGQL, ViewDriverQuery } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { camelCase } from 'camel-case';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzUploadFile } from 'ng-zorro-antd/upload';
import { firstValueFrom, map, Observable, Observer, Subscription } from 'rxjs';

@Component({
  selector: 'app-driver-profile-details',
  templateUrl: './driver-profile-details.component.html',
  styles: [
    'nz-input-number {@apply w-full}'
  ]
})
export class DriverProfileDetailsComponent implements OnInit, OnDestroy {
  form = this.fb.group({
    id: [null, Validators.required],
    firstName: [null, Validators.required],
    lastName: [null, Validators.required],
    mobileNumber: [null, Validators.required],
    gender: [null],
    email: [null],
    fleetId: [null],
    carId: [null],
    carColorId: [null],
    carProductionYear: [null],
    carPlate: [null],
    accountNumber: [null],
    bankName: [null],
    bankRoutingNumber: [null],
    bankSwift: [null],
    address: [null],
    mediaId: [null],
    enabledServices: [null, Validators.required]
  });
  root: string = environment.root;
  subscription?: Subscription;
  query?: Observable<ApolloQueryResult<ViewDriverQuery>>;
  genders = Object.values(Gender);
  public gender = Gender;
  public camelCase = camelCase;
  jwt = localStorage.getItem('ridy_admin_token');
  loadingUpload = false;
  avatarUrl?: string;

  beforeUpload = (file: NzUploadFile, _fileList: NzUploadFile[]) =>
    new Observable((observer: Observer<boolean>) => {
      const isJpgOrPng = file.type === 'image/jpeg' || file.type === 'image/png';
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
    private msg: NzMessageService,
    private updateGQL: UpdateDriverProfileGQL,
    private routerHelper: RouterHelperService,
    private fb: UntypedFormBuilder) {
  }

  ngOnInit(): void {
    this.query = this.route.parent?.data.pipe(map(data => data.driver));
    this.subscription = this.route.parent?.data.subscribe(data => {
      data.driver.data.driver.enabledServices = data.driver.data.driver.enabledServices.map((_service: {id: string}) => _service.id);
      this.form.patchValue(data.driver.data.driver);
      this.avatarUrl = data.driver.data.driver.media?.address;
    });
  }

  ngOnDestroy(): void {
    this.subscription?.unsubscribe();
  }

  async onSubmit() {
    const { id, mobileNumber, enabledServices, ...update } = this.form.value;
    await firstValueFrom(this.updateGQL.mutate({ id, update, serviceIds: enabledServices }));
    this.msg.success('Updated!');
    this.routerHelper.refresh(this.route);
  }

  handleServiceCheckChange(checked: boolean, service: { id: string }) {
    if (checked) {
      if (this.form.value.enabledServices.indexOf(service.id) < 0) {
        this.form.value.enabledServices.push(service.id);
        this.form.patchValue({enabledServices: this.form.value.enabledServices});
      }
    } else {
      this.form.patchValue({enabledServices: this.form.value.enabledServices.filter((_service: string) => _service != service.id.toString())});
    }
  }

  handleUploadChange(event: { file: NzUploadFile }) {
    switch (event.file.status) {
      case 'uploading':
        //this.loading = true;
        break;
      case 'done':
        // Get this url from response in real world.
        this.form.patchValue({ mediaId: event.file.response.id });
        this.avatarUrl = event.file.response.address;
        break;
      case 'error':
        this.msg.error('Network error');
        //this.loading = false;
        break;
    }
  }
}