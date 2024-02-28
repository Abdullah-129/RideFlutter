import { Component, OnDestroy, OnInit, TemplateRef, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { CurrentConfigurationQuery, DisableServerGQL, UpdateConfigStatus, UpdateFirebaseGQL, UpdateMapsApiKeyGQL, UpdatePurchaseCodeGQL, UpdatePurchaseCodeStatus } from '@ridy/admin-panel/generated/graphql';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzModalRef, NzModalService } from 'ng-zorro-antd/modal';
import { NzUploadChangeParam } from 'ng-zorro-antd/upload';
import { firstValueFrom, map, Observable, Subscription } from 'rxjs';


@Component({
  selector: 'app-config',
  templateUrl: './config.component.html',
  styleUrls: ['./config.component.css']
})
export class ConfigComponent implements OnInit, OnDestroy {
  currentStep = 0;
  tplModal!: NzModalRef;
  remoteConfig!: Observable<ApolloQueryResult<CurrentConfigurationQuery>>;
  currentConfig!: CurrentConfigurationQuery;
  root = environment.root;
  clients: string[] = [];
  selectedClient!: string;
  configed = false;
  tplModalButtonLoading = false;
  @ViewChild('tplContent') clientModalContent!: TemplateRef<HTMLElement>;
  @ViewChild('tplFooter') clientModalFooter!: TemplateRef<HTMLElement>;

  configSubscription?: Subscription;

  constructor(
    private route: ActivatedRoute,
    private updatePurchaseGql: UpdatePurchaseCodeGQL,
    private updateMapsGql: UpdateMapsApiKeyGQL,
    private updateFirebaseGql: UpdateFirebaseGQL,
    private disableServerGql: DisableServerGQL,
    private modalService: NzModalService,
    private msg: NzMessageService) { }


  ngOnInit(): void {
    this.remoteConfig = this.route.data.pipe(map(data => data.config));
    this.configSubscription = this.remoteConfig.subscribe(data => this.currentConfig = data.data);
  }

  ngOnDestroy(): void {
    this.configSubscription?.unsubscribe();
  }

  pre(): void {
    this.currentStep -= 1;
  }

  async next() {
    switch (this.currentStep) {
      case (0): {
        if (this.currentConfig.currentConfiguration.purchaseCode == null) {
          this.msg.error('Purchase code is invalid.');
          return;
        }
        const result = await firstValueFrom(this.updatePurchaseGql.mutate({ code: this.currentConfig.currentConfiguration.purchaseCode ?? '' }));
        console.log(result);
        if (result.data?.updatePurchaseCode.status == UpdatePurchaseCodeStatus.ClientFound) {
          this.clients = result.data?.updatePurchaseCode.clients?.map(client => client.ip) ?? [];
          this.createClientsModal();
          return;
        }
        if (result.data?.updatePurchaseCode.status == UpdatePurchaseCodeStatus.Invalid) {
          this.msg.error('Purchase code is Invalid. You can contact minimalistic.apps@gmail.com for more information.');
        }
        if (result.data?.updatePurchaseCode.status == UpdatePurchaseCodeStatus.Ok) {
          this.currentStep += 1;
        }
        break;
      }

      case (1): {
        if (this.currentConfig.currentConfiguration.adminPanelAPIKey == null || this.currentConfig.currentConfiguration.adminPanelAPIKey.length < 10 || this.currentConfig.currentConfiguration.backendMapsAPIKey == null || this.currentConfig.currentConfiguration.backendMapsAPIKey.length < 10) {
          this.msg.error('Google Maps API Keys seems invalid.');
          return;
        }
        const result = await firstValueFrom(this.updateMapsGql.mutate({ backend: this.currentConfig.currentConfiguration.backendMapsAPIKey, adminPanel: this.currentConfig.currentConfiguration.adminPanelAPIKey }));
        if (result.data?.updateMapsAPIKey.status == UpdateConfigStatus.Ok) {
          this.currentStep += 1;
        } else {
          this.msg.error(result.data?.updateMapsAPIKey.message ?? 'Unknown Error');
        }
        break;
      }
    }
  }

  createClientsModal(): void {
    this.tplModal = this.modalService.create({
      nzTitle: 'License Verification',
      nzContent: this.clientModalContent,
      nzFooter: this.clientModalFooter,
      nzMaskClosable: false,
      nzClosable: false
    });
  }
  async disableServer() {
    this.tplModalButtonLoading = true;
    await firstValueFrom(this.disableServerGql.mutate({ ip: this.selectedClient }));
    this.msg.success('Disable was successful.');
    this.tplModal.close();
  }

  async done() {
    if (this.currentConfig.currentConfiguration.firebaseProjectPrivateKey == null) {
      this.msg.error('Firebase Project key seems invalid.');
      return;
    }
    const result = await firstValueFrom(this.updateFirebaseGql.mutate({ keyFileName: this.currentConfig.currentConfiguration.firebaseProjectPrivateKey }));
    if (result.data?.updateFirebase.status == UpdateConfigStatus.Ok) {
      this.configed = true;
    } else {
      this.msg.error(result.data?.updateFirebase.message ?? 'Unknown error');
    }
  }

  handleChange(event: NzUploadChangeParam): void {
    const status = event.file.status;
    if (status !== 'uploading') {
    }
    if (status === 'done') {
      this.msg.success(`${event.file.name} file uploaded successfully.`);
      this.currentConfig.currentConfiguration.firebaseProjectPrivateKey = event.file.name;
    } else if (status === 'error') {
      this.msg.error(`${event.file.name} file upload failed.`);
    }
  }
}
