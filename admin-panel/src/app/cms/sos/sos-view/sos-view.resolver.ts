import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewSosGQL, ViewSosQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class SOSViewResolver implements Resolve<ApolloQueryResult<ViewSosQuery>> {
  constructor(
    private gql: ViewSosGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewSosQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
