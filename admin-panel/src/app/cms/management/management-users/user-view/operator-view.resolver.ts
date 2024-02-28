import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewOperatorGQL, ViewOperatorQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class OperatorViewResolver implements Resolve<ApolloQueryResult<ViewOperatorQuery>> {
  constructor(
    private gql: ViewOperatorGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewOperatorQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
