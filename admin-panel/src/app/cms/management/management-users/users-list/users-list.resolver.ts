import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { OperatorFilter, OperatorSortFields, UsersListGQL, UsersListQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class UsersListResolver implements Resolve<ApolloQueryResult<UsersListQuery>> {
  constructor(
    private paging: TableService,
    private gql: UsersListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<UsersListQuery>> {
    const params = this.paging.deserializeQueryParams<OperatorSortFields, OperatorFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
