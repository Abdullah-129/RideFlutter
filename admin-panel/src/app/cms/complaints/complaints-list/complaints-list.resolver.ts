import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
    ComplaintFilter,
    ComplaintsListGQL,
    ComplaintsListQuery,
    ComplaintSortFields,
} from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class ComplaintsListResolver implements Resolve<ApolloQueryResult<ComplaintsListQuery>> {
  constructor(
    private paging: TableService,
    private gql: ComplaintsListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ComplaintsListQuery>> {
    const params = this.paging.deserializeQueryParams<ComplaintSortFields, ComplaintFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
