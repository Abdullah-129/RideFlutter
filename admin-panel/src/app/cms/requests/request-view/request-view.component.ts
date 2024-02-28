import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewOrderQuery } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-request-view',
  templateUrl: './request-view.component.html'
})
export class RequestViewComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewOrderQuery>>;  
  constructor(
    private route: ActivatedRoute,
    public tagColor: TagColorService) { }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.order));

  }

}
