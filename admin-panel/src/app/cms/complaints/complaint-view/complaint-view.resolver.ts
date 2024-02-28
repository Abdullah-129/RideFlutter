import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewComplaintGQL, ViewComplaintQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class ComplaintViewResolver implements Resolve<ApolloQueryResult<ViewComplaintQuery>> {
  constructor(
    private gql: ViewComplaintGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewComplaintQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
