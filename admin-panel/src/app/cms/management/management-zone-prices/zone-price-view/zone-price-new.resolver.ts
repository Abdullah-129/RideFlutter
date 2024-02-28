import { Injectable } from '@angular/core';
import {
  ActivatedRouteSnapshot,
  Resolve,
  RouterStateSnapshot,
} from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
  ZonePriceNewGQL,
  ZonePriceNewQuery,
} from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class ZonePriceNewResolver
  implements Resolve<ApolloQueryResult<ZonePriceNewQuery>>
{
  constructor(private gql: ZonePriceNewGQL) {}

  resolve(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
  ): Observable<ApolloQueryResult<ZonePriceNewQuery>> {
    return this.gql.fetch();
  }
}
