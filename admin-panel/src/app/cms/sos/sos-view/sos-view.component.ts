import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ComplaintStatus, UpdateComplaintStatusGQL, ViewSosQuery } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { firstValueFrom, map, Observable } from 'rxjs';
import { camelCase } from "camel-case";
import { RouterHelperService } from '../../../@services/router-helper.service';
import { NzMessageService } from 'ng-zorro-antd/message';

@Component({
  selector: 'app-sos-view',
  templateUrl: './sos-view.component.html'
})
export class SOSViewComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewSosQuery>>;
  public camelCase = camelCase;
  public complaintStatus = ComplaintStatus;

  constructor(
    private route: ActivatedRoute,
    public tagColor: TagColorService, 
    private updateGql: UpdateComplaintStatusGQL,
    private routerHelper: RouterHelperService,
    private msg: NzMessageService) {
   }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.sos));
  }

  async updateStatus(status: ComplaintStatus) {
    await firstValueFrom(this.updateGql.mutate({id: this.route.snapshot.params.id, status}));
    this.routerHelper.refresh(this.route);
    this.msg.success('Updated!');
  }
}
