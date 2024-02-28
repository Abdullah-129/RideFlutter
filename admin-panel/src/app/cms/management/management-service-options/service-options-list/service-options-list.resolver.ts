import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ServiceOptionsListGQL, ServiceOptionsListQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class ServiceOptionsListResolver implements Resolve<ApolloQueryResult<ServiceOptionsListQuery>> {
  constructor(
    private paging: TableService,
    private gql: ServiceOptionsListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ServiceOptionsListQuery>> {
    //const params = this.paging.deserializeQueryParams<FeedbackParameterSortFields, FeedbackParameterFilter>(route.queryParams);
    return this.gql.fetch();
  }
}
