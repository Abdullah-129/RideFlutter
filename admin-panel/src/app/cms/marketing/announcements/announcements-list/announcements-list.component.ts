import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { AnnouncementsListQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-announcement-list',
  templateUrl: './announcements-list.component.html'
})
export class AnnouncementsListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<AnnouncementsListQuery>>;

  constructor(
    public tableService: TableService,
    private route: ActivatedRoute
  ) {}

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.announcements));
  }
  
}
