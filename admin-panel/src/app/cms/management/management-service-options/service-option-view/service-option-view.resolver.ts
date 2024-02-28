import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ServiceOptionViewQuery, ServiceOptionViewGQL } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class ServiceOptionViewResolver implements Resolve<ApolloQueryResult<ServiceOptionViewQuery>> {
    constructor(
        private gql: ServiceOptionViewGQL
    ) { }

    resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ServiceOptionViewQuery>> {
        return this.gql.fetch({ id: route.params.id });
    }
}
