import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ReviewParametersListGQL, ReviewParametersListQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class ReviewParametersListResolver implements Resolve<ApolloQueryResult<ReviewParametersListQuery>> {
  constructor(
    private paging: TableService,
    private gql: ReviewParametersListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ReviewParametersListQuery>> {
    //const params = this.paging.deserializeQueryParams<FeedbackParameterSortFields, FeedbackParameterFilter>(route.queryParams);
    return this.gql.fetch();
  }
}
