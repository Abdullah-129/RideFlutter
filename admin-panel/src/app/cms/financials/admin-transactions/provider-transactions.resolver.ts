import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
    ProviderTransactionFilter,
    ProviderTransactionSortFields,
    ProviderWalletsListGQL,
    ProviderWalletsListQuery,
} from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class ProviderWalletsListResolver implements Resolve<ApolloQueryResult<ProviderWalletsListQuery>> {
  constructor(
    private paging: TableService,
    private gql: ProviderWalletsListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ProviderWalletsListQuery>> {
    const params = this.paging.deserializeQueryParams<ProviderTransactionSortFields, ProviderTransactionFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
