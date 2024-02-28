import { Injectable } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  Resolve,
  RouterStateSnapshot,
} from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
  FleetFilter,
  FleetFinancialsGQL,
  FleetFinancialsQuery,
  FleetSortFields,
  FleetTransactionFilter,
  FleetTransactionSortFields,
  FleetZonePricesGQL,
  FleetZonePricesQuery,
  ZonePriceFilter,
  ZonePriceSortFields,
} from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class FleetViewZonePricesResolver
  implements Resolve<ApolloQueryResult<FleetZonePricesQuery>>
{
  constructor(
    private gql: FleetZonePricesGQL,
    private tableService: TableService
  ) {}

  resolve(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<ApolloQueryResult<FleetZonePricesQuery>> {
    const paging = this.tableService.deserializeQueryParams<
      ZonePriceSortFields,
      ZonePriceFilter
    >(route.queryParams);
    return this.gql.fetch({ id: route.parent?.params.id, ...paging });
  }
}
