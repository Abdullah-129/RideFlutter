import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewDriverGQL, ViewDriverQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class DriverProfileResolver implements Resolve<ApolloQueryResult<ViewDriverQuery>> {
  constructor(
    private gql: ViewDriverGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewDriverQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
