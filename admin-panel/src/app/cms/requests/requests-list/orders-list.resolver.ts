import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { OperatorFilter, OperatorSortFields, OrderFilter, OrdersListGQL, OrdersListQuery, OrderSortFields } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class OrdersListResolver implements Resolve<ApolloQueryResult<OrdersListQuery>> {
  constructor(
    private paging: TableService,
    private gql: OrdersListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<OrdersListQuery>> {
    const params = this.paging.deserializeQueryParams<OrderSortFields, OrderFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
