import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { RiderAddressesGQL, RiderAddressesQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class RiderViewAddresssesResolver implements Resolve<ApolloQueryResult<RiderAddressesQuery>> {
  constructor(
    private gql: RiderAddressesGQL,
    private tableService: TableService
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<RiderAddressesQuery>> {
    const paging = this.tableService.deserializeQueryParams(route.queryParams);
    return this.gql.fetch({ riderId: route.parent?.params.id, paging: paging.paging });
  }
}
