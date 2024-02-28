import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { RiderFilter, RidersListGQL, RidersListQuery, RiderSortFields } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class RidersListResolver implements Resolve<ApolloQueryResult<RidersListQuery>> {
  constructor(
    private paging: TableService,
    private gql: RidersListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<RidersListQuery>> {
    const params = this.paging.deserializeQueryParams<RiderSortFields, RiderFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
