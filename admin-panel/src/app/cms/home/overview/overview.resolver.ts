import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { OverviewGQL, ViewOrderQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class OverviewResolver implements Resolve<ApolloQueryResult<ViewOrderQuery>> {
  constructor(
    private gql: OverviewGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewOrderQuery>> {
    return this.gql.fetch();
  }
}
