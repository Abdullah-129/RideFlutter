import { Component, OnInit } from '@angular/core';
import { Params, ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ComplaintsListQuery, ComplaintStatus } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { map, Observable } from 'rxjs';
import { TableService } from '../../../@services/table-service';
import { camelCase } from "camel-case";

@Component({
  selector: 'app-complaints-list',
  templateUrl: './complaints-list.component.html'
})
export class ComplaintsListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ComplaintsListQuery>>;
  public complaintStatus = ComplaintStatus;
  public camelCase = camelCase;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    public tagColor: TagColorService,
    public tableService: TableService) { }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.complaints));
  }
}
