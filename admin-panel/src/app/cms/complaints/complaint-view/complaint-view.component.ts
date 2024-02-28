import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ComplaintStatus, UpdateComplaintStatusGQL, ViewComplaintQuery } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { firstValueFrom, map, Observable } from 'rxjs';
import { camelCase } from "camel-case";
import { RouterHelperService } from '../../../@services/router-helper.service';
import { NzMessageService } from 'ng-zorro-antd/message';

@Component({
  selector: 'app-complaint-view',
  templateUrl: './complaint-view.component.html'
})
export class ComplaintViewComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewComplaintQuery>>;
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
    this.query = this.route.data.pipe(map(data => data.complaint));
  }

  async updateStatus(status: ComplaintStatus) {
    await firstValueFrom(this.updateGql.mutate({id: this.route.snapshot.params.id, status}));
    this.routerHelper.refresh(this.route);
    this.msg.success('Updated!');
  }
}
