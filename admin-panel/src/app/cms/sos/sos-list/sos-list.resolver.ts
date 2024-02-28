import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
  DistressSignalFilter,
  DistressSignalSortFields,
    SosListGQL,
    SosListQuery
} from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class SOSListResolver implements Resolve<ApolloQueryResult<SosListQuery>> {
  constructor(
    private paging: TableService,
    private gql: SosListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<SosListQuery>> {
    const params = this.paging.deserializeQueryParams<DistressSignalSortFields, DistressSignalFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
