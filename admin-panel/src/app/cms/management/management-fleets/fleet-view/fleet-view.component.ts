import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { map, Observable } from 'rxjs';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewFleetQuery } from '@ridy/admin-panel/generated/graphql';

@Component({
  selector: 'app-fleet-view',
  templateUrl: './fleet-view.component.html'
})
export class FleetViewComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewFleetQuery>>;

  constructor(private route: ActivatedRoute, public tagColor: TagColorService) {}

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.fleet));
  }
}
