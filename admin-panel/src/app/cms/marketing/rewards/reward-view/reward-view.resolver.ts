import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewRewardGQL, ViewRewardQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class RewardViewResolver implements Resolve<ApolloQueryResult<ViewRewardQuery>> {
  constructor(
    private gql: ViewRewardGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewRewardQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
