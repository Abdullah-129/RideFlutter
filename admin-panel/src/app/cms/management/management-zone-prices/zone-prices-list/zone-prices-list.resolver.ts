import { Injectable } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  Resolve,
  RouterStateSnapshot,
} from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
  ReviewParametersListGQL,
  ReviewParametersListQuery,
  ZonePriceFilter,
  ZonePricesListGQL,
  ZonePricesListQuery,
  ZonePriceSortFields,
} from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class ZonePricesListResolver
  implements Resolve<ApolloQueryResult<ZonePricesListQuery>>
{
  constructor(private paging: TableService, private gql: ZonePricesListGQL) {}

  resolve(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<ApolloQueryResult<ZonePricesListQuery>> {
    const params = this.paging.deserializeQueryParams<
      ZonePriceSortFields,
      ZonePriceFilter
    >(route.queryParams);
    return this.gql.fetch(params);
  }
}
