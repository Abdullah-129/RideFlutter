import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { TranslateService } from '@ngx-translate/core';
import { RidersListQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { TableService } from '../../../@services/table-service';

@Component({
  selector: 'app-riders-list',
  templateUrl: './riders-list.component.html'
})
export class RidersListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<RidersListQuery>>;

  constructor(
    public route: ActivatedRoute,
    public translate: TranslateService,
    public tableService: TableService) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.riders));  
  }
}
