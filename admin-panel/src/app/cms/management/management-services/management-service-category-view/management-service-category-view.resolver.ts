import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewServiceCategoryGQL, ViewServiceCategoryQuery } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class ManagementServicesCategoryViewResolver implements Resolve<ApolloQueryResult<ViewServiceCategoryQuery>> {
    constructor(
        private gql: ViewServiceCategoryGQL
    ) { }

    resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ViewServiceCategoryQuery>> {
        return this.gql.fetch({ id: route.params.id });
    }
}
