import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewServiceGQL, ViewServiceQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class ManagementServicesViewResolver implements Resolve<ApolloQueryResult<ViewServiceQuery>> {
    constructor(
        private gql: ViewServiceGQL
    ) { }

    resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewServiceQuery>> {
        return this.gql.fetch({ id: route.params.id });
    }
}
