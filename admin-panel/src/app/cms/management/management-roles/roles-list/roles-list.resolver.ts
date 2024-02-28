import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { RolesGQL, RolesQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class RolesListResolver implements Resolve<ApolloQueryResult<RolesQuery>> {
  constructor(
    private gql: RolesGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<RolesQuery>> {
    return this.gql.fetch({});
  }
}
