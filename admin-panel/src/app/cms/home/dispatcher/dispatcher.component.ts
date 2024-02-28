import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
import CoordinateXY from '@ridy/admin-panel/src/app/@models/coordinatexy';
import { NzMessageService } from 'ng-zorro-antd/message';
import { NzModalService } from 'ng-zorro-antd/modal';

@Component({
  selector: 'app-dispatcher',
  templateUrl: './dispatcher.component.html'
})
export class DispatcherComponent implements OnInit {
  current = 0;
  selectedRiderId!: number;
  services: any[] = [];
  currency!: string;
  tripDistance = 0;
  tripDuration = 0;
  isLoadingRiders = false;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private messageService: NzMessageService,
    private modal: NzModalService,
    private translate: TranslateService) { }

  ngOnInit(): void {
    this.route.queryParams.subscribe(x => {
      if(x['serviceId'] != null) {
        this.current = 3;
      } else if(x['points'] != null) {
        this.current = 2;
      } else if(x['riderId'] != null) {
        this.selectedRiderId = parseInt(x['riderId']);
        this.current = 1;
      }
    });
    // this.socket.on('driverAccepted', async (request: Request) => {
    //   let modal = this.modal.create({
    //     nzTitle: await this.translate.get('message.success.title').toPromise(),
    //     nzContent: await this.translate.get('dispatcher.message.requestAssigned').toPromise(),
    //     nzFooter: [
    //       {
    //         label: await this.translate.get('dispatcher.viewRequest').toPromise(),
    //         type: 'primary',
    //         onClick: () => {
    //           this.viewRequest(request.id);
    //           modal.close();
    //         }
    //       },
    //       {
    //         label: await this.translate.get('profile.cancel').toPromise(),
    //         onClick: () => {
    //           modal.close();
    //         }
    //       }
    //     ]
    //   });
    // });
  }

  viewRequest(id: number) {
    this.router.navigate(['../../../requests/view', id], {relativeTo: this.route});
  }

  refreshDrivers() {
    // this.socket.emit('getDriversLocation', null, (result: GetAllDriversLocationResult[]) => {
    //   this.drivers = result;
    //   this.centerMap();
    // });
  }
}