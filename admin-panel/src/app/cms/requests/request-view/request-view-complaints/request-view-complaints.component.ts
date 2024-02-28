import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewOrderQuery } from '@ridy/admin-panel/generated/graphql';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-request-view-complaints',
  templateUrl: './request-view-complaints.component.html'
})
export class RequestViewComplaintsComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewOrderQuery>>;

  constructor(
    private route: ActivatedRoute
    ) { }

  ngOnInit(): void {
    this.query = this.route.parent?.data.pipe(map(data => data.order))
  }
}
