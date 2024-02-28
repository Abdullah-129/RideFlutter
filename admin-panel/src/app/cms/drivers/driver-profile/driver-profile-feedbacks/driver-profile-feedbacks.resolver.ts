import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { DriverFeedbacksGQL, DriverFeedbacksQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { Observable } from 'rxjs';

@Injectable()
export class DriverProfileFeedbacksResolver implements Resolve<ApolloQueryResult<DriverFeedbacksQuery>> {
  constructor(
    private gql: DriverFeedbacksGQL,
    private tableService: TableService
  ) { }

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<DriverFeedbacksQuery>> {
    const paging = this.tableService.deserializeQueryParams(route.queryParams);
    return this.gql.fetch({ id: route.parent?.params.id, paging: paging.paging });
  }
}
