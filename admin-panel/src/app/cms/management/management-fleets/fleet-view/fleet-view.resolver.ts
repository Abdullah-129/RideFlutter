import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewFleetGQL, ViewFleetQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class FleetViewResolver implements Resolve<ApolloQueryResult<ViewFleetQuery>> {
  constructor(
    private gql: ViewFleetGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewFleetQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
