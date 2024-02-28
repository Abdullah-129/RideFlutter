import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { CouponFilter, CouponListGQL, CouponListQuery, CouponSortFields } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class CouponsListResolver implements Resolve<ApolloQueryResult<CouponListQuery>> {
  constructor(
    private paging: TableService,
    private gql: CouponListGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<CouponListQuery>> {
    const params = this.paging.deserializeQueryParams<CouponSortFields, CouponFilter>(route.queryParams);
    return this.gql.fetch(params);
  }
}
