import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { DriverFilter, DriversListGQL, DriversListQuery, DriverSortFields } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class DriversListResolver implements Resolve<ApolloQueryResult<DriversListQuery>> {
  constructor(
    private paging: TableService,
    private gql: DriversListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<DriversListQuery>> {
    const params = this.paging.deserializeQueryParams<DriverSortFields, DriverFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
