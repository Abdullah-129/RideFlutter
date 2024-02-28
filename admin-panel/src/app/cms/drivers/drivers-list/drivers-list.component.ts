import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { TranslateService } from '@ngx-translate/core';
import { DriversListQuery, DriverStatus } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { camelCase } from 'camel-case';
import { map, Observable } from 'rxjs';

import { TableService } from '../../../@services/table-service';

@Component({
  selector: 'app-drivers-list',
  templateUrl: './drivers-list.component.html'
})
export class DriversListComponent implements OnInit {
  statuses: {text: string, value: string}[] = Object.values(DriverStatus).map(key => ({value: key, text: this.translator.instant(`enum.driver.status.${camelCase(key)}`)}));
  query?: Observable<ApolloQueryResult<DriversListQuery>>;
  toCamelCase = camelCase;

  constructor(
    public tagColor: TagColorService,
    public tableService: TableService,
    public route: ActivatedRoute,
    private translator: TranslateService) { }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.drivers));
  }
}