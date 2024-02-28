import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { RiderTransactionFilter, RiderTransactionSort, RiderTransactionSortFields, RiderWalletGQL, RiderWalletQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class RiderViewFinancialsResolver implements Resolve<ApolloQueryResult<RiderWalletQuery>> {
  constructor(
    private gql: RiderWalletGQL,
    private tableService: TableService
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<RiderWalletQuery>> {
    const paging = this.tableService.deserializeQueryParams<RiderTransactionSortFields, RiderTransactionFilter>(route.queryParams);
    return this.gql.fetch({ riderId: route.parent?.params.id, ...paging });
  }
}
