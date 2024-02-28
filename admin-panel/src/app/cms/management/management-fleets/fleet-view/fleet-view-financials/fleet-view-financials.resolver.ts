import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { FleetFilter, FleetFinancialsGQL, FleetFinancialsQuery, FleetSortFields, FleetTransactionFilter, FleetTransactionSortFields } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class FleetViewFinancialsResolver implements Resolve<ApolloQueryResult<FleetFinancialsQuery>> {
  constructor(
    private gql: FleetFinancialsGQL,
    private tableService: TableService
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<FleetFinancialsQuery>> {
    const paging = this.tableService.deserializeQueryParams<FleetTransactionSortFields, FleetTransactionFilter>(route.queryParams);
    return this.gql.fetch({ id: route.parent?.params.id, ...paging });
  }
}
