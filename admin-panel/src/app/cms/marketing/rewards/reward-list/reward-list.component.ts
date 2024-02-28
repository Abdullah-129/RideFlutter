import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { RewardListQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-reward-list',
  templateUrl: './reward-list.component.html'
})
export class RewardListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<RewardListQuery>>;

  constructor(
    public route: ActivatedRoute,
    public tableService: TableService,
    public tagColor: TagColorService) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.rewards));  
  }
}
