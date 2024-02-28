import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
    FleetTransactionFilter,
    FleetTransactionSortFields,
    FleetWalletsListGQL,
    FleetWalletsListQuery,
} from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class FleetWalletsListResolver implements Resolve<ApolloQueryResult<FleetWalletsListQuery>> {
  constructor(
    private paging: TableService,
    private gql: FleetWalletsListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<FleetWalletsListQuery>> {
    const params = this.paging.deserializeQueryParams<FleetTransactionSortFields, FleetTransactionFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
