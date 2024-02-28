import { Component, OnDestroy, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { CreatePaymentGatewayGQL, PaymentGatewayType, UpdatePaymentGatewayGQL, ViewPaymentGatewayQuery } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzUploadFile } from 'ng-zorro-antd/upload';
import { firstValueFrom, Observable, Observer, Subscription } from 'rxjs';

@Component({
  selector: 'app-payment-gateway-view',
  templateUrl: './payment-gateway-view.component.html'
})
export class PaymentGatewayViewComponent implements OnInit, OnDestroy {
  form = this.fb.group({
    id: [null],
    title: [null, Validators.required],
    type: [null, Validators.required],
    enabled: [false, Validators.required],
    privateKey: [null, Validators.required],
    publicKey: [null],
    saltKey: [null],
    merchantId: [null],
    mediaId: [null],
  });
  subscription?: Subscription;
  gatewayTypes = Object.keys(PaymentGatewayType);
  root = environment.root;
  jwt = localStorage.getItem('ridy_admin_token');
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
  avatarUrl?: string;
  loadingUpload = false;


  constructor(
    private route: ActivatedRoute,
    private fb: UntypedFormBuilder,
    private updateGQL: UpdatePaymentGatewayGQL,
    private createGQL: CreatePaymentGatewayGQL,
    private routerHelper: RouterHelperService,
    private msg: NzMessageService) { }

  ngOnInit(): void {
    this.subscription = this.route.data.subscribe(data => {
      const gateway: ApolloQueryResult<ViewPaymentGatewayQuery> = data.paymentGateway;
      this.form.patchValue(gateway.data.paymentGateway as any);
      this.avatarUrl = gateway.data.paymentGateway?.media?.address;
    });
  }

  ngOnDestroy() {
    this.subscription?.unsubscribe();
  }

  async onSubmit() {
    const { id, ...input } = this.form.value;
    if (id == null) {
      const res = await firstValueFrom(this.createGQL.mutate({ input }));
    } else {
      const res = await firstValueFrom(this.updateGQL.mutate({ id, input }));
    }
    this.routerHelper.goToParent(this.route);
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
}
