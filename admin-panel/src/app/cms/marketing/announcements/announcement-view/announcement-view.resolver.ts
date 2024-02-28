import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewAnnouncementGQL, ViewAnnouncementQuery, ViewFleetGQL, ViewFleetQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class AnnouncementViewResolver implements Resolve<ApolloQueryResult<ViewAnnouncementQuery>> {
  constructor(
    private gql: ViewAnnouncementGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewAnnouncementQuery>> {
    return this.gql.fetch({id: route.params.id});
  }
}
