import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot, RouterStateSnapshot } from '@angular/router';
import { CurrentConfigurationGQL, CurrentConfigurationQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';
import { ApolloQueryResult } from '@apollo/client/core';

@Injectable()
export class ConfigResolver implements Resolve<ApolloQueryResult<CurrentConfigurationQuery>> {
  constructor(
    private currentConfigGql: CurrentConfigurationGQL
  ) {}

  resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<CurrentConfigurationQuery>> {
    return this.currentConfigGql.fetch({});
  }
}
