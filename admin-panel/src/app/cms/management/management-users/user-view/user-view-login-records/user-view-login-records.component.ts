import { Component, OnInit } from '@angular/core';
import { Params, ActivatedRoute, Router } from '@angular/router';
import { OperatorAccessRecord } from '@ridy/admin-panel/src/app/@models/entities/operator-access.record';
import { BackendService } from '@ridy/admin-panel/src/app/@services/backend/backend.service';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';

@Component({
  selector: 'app-user-view-login-records',
  templateUrl: './user-view-login-records.component.html',
  styleUrls: ['./user-view-login-records.component.css']
})
export class UserViewLoginRecordsComponent implements OnInit {
  pageIndex = 1;
  pageSize = 10;
  total = 1;
  listOfData: OperatorAccessRecord[] = [];
  queryParams: Params = {};

  constructor(private backend: BackendService,  private route: ActivatedRoute, private router: Router) {
  }

  async searchData(reset: boolean = false): Promise<void> {
    if (reset) {
      this.pageIndex = 1;
    }
    this.backend.getRows<OperatorAccessRecord>({ 
      table: 'OperatorAccessRecord',
      filters: { operator: { id: this.route.parent.snapshot.paramMap.get('id') }},
      page: this.pageIndex,
      pageSize: this.pageSize
    }).then(result => {
      this.listOfData = result.data;
      this.total = result.count;
    });
  }

  ngOnInit(): void {
    this.searchData(true);
  }

}
