import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { DeleteDriverGQL, DriverStatus, UpdateDriverStatusGQL, ViewDriverQuery } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, map, Observable } from 'rxjs';
import { camelCase } from 'camel-case';
import { RouterHelperService } from '../../../@services/router-helper.service';
import { NzModalService } from 'ng-zorro-antd/modal';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-driver-profile',
  templateUrl: './driver-profile.component.html'
})
export class DriverProfileComponent implements OnInit {
  public driverStatus = DriverStatus; 
  query?: Observable<ApolloQueryResult<ViewDriverQuery>>;
  root = environment.root;
  toCamelCase = camelCase;

  constructor(
    private route: ActivatedRoute,
    public tagColor: TagColorService,
    private message: NzMessageService,
    private modal: NzModalService,
    private deleteGQL: DeleteDriverGQL,
    private updateGQL: UpdateDriverStatusGQL,
    private routerHelper: RouterHelperService,
    private router: Router,
    private translate: TranslateService) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.driver));
  }

  async changeStatus(status: DriverStatus) {
    const id = this.route.snapshot.params.id ?? 0;
    await firstValueFrom(this.updateGQL.mutate({ id, status }));
    this.routerHelper.refresh(this.route);
  }

  deleteDriver(id: string) {
    this.modal.confirm({
      nzTitle: this.translate.instant('message.deleteDriverConfirmation.title'),
      nzContent: this.translate.instant('message.deleteDriverConfirmation.content'),
      nzOnOk: async () => {
        try {
          await firstValueFrom(this.deleteGQL.mutate({id}));
          this.message.success(this.translate.instant('message.deleteDriverCofirmAlert'));
          this.router.navigateByUrl('/drivers');
        } catch(error: any) {
          if(error.message == 'PERMISSION_NOT_GRANTED') {
            this.message.error(this.translate.instant('error.PERMISSION_NOT_GRANTED'));
          } else {
            this.message.error(error.message);
          }
        }
      }
    });
  }
}
