import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { AnnouncementFilter, AnnouncementsListGQL, AnnouncementsListQuery, AnnouncementSortFields, FleetFilter, FleetsListGQL, FleetsListQuery, FleetSortFields, RiderFilter, RidersListGQL, RidersListQuery, RiderSortFields } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class AnnouncementsListResolver implements Resolve<ApolloQueryResult<AnnouncementsListQuery>> {
  constructor(
    private paging: TableService,
    private gql: AnnouncementsListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<AnnouncementsListQuery>> {
    const params = this.paging.deserializeQueryParams<AnnouncementSortFields, AnnouncementFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
