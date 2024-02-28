import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { DriverFinancialsGQL, DriverFinancialsQuery, DriverTransactionFilter, DriverTransactionSortFields } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class DriverProfileFinancialsResolver implements Resolve<ApolloQueryResult<DriverFinancialsQuery>> {
  constructor(
    private gql: DriverFinancialsGQL,
    private tableService: TableService
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<DriverFinancialsQuery>> {
    const paging = this.tableService.deserializeQueryParams<DriverTransactionSortFields, DriverTransactionFilter>(route.queryParams);
    return this.gql.fetch({ id: route.parent?.params.id, ...paging });
  }
}
