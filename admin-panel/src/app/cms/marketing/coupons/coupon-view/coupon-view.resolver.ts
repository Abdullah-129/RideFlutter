import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewCouponGQL, ViewCouponQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class CouponViewResolver implements Resolve<ApolloQueryResult<ViewCouponQuery>> {
  constructor(
    private gql: ViewCouponGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewCouponQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
