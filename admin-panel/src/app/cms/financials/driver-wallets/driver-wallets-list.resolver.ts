import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
    DriverTransactionFilter,
    DriverTransactionSortFields,
    DriverWalletsListGQL,
    DriverWalletsListQuery,
} from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class DriverWalletsListResolver implements Resolve<ApolloQueryResult<DriverWalletsListQuery>> {
  constructor(
    private paging: TableService,
    private gql: DriverWalletsListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<DriverWalletsListQuery>> {
    const params = this.paging.deserializeQueryParams<DriverTransactionSortFields, DriverTransactionFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
