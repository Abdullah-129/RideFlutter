import { Component, OnInit } from '@angular/core';
import { Params, ActivatedRoute, Router } from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd/message';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { Observable } from 'rxjs';
import { ApolloQueryResult } from '@apollo/client/core';
import { RegionListQuery } from '@ridy/admin-panel/generated/graphql';
import { map } from 'rxjs/operators';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';

@Component({
  selector: 'app-region-list',
  templateUrl: './region-list.component.html'
})
export class RegionListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<RegionListQuery>>;

  constructor(
    private route: ActivatedRoute,
    public tableService: TableService,
    private router: Router, 
    public tagColor: TagColorService) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.regions));
  }
}
