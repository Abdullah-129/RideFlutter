import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { UsersListQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-users-list',
  templateUrl: './users-list.component.html'
})
export class UsersListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<UsersListQuery>>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    public tagColor: TagColorService,
    public tableService: TableService) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.operators));
  }
}
