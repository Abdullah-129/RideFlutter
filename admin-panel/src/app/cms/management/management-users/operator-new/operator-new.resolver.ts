import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { NewOperatorGQL, NewOperatorQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class OperatorNewResolver implements Resolve<ApolloQueryResult<NewOperatorQuery>> {
  constructor(
    private gql: NewOperatorGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<NewOperatorQuery>> {
    return this.gql.fetch({});
  }
}
