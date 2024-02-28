import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { TranslateService } from '@ngx-translate/core';
import { RidersListQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-dispatcher-riders-list',
  templateUrl: './dispatcher-riders-list.component.html',
  styles: [
  ]
})
export class DispatcherRidersListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<RidersListQuery>>;

  constructor(
    public route: ActivatedRoute,
    public translate: TranslateService,
    public tableService: TableService,
    private router: Router) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.riders));  
  }

  selectRider(id: string) {
    this.router.navigate(['../locations-select'], {
      relativeTo: this.route,
      queryParams: { riderId: id },
      queryParamsHandling: 'merge'
    });
  }
}
