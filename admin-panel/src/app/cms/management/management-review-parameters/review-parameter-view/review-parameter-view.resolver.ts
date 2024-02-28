import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, Resolve, RouterStateSnapshot } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ReviewParameterViewQuery, ReviewParameterViewGQL } from '@ridy/admin-panel/generated/graphql';
import { Observable } from 'rxjs';

@Injectable()
export class ReviewParameterViewResolver implements Resolve<ApolloQueryResult<ReviewParameterViewQuery>> {
    constructor(
        private gql: ReviewParameterViewGQL
    ) { }

    resolve(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<ApolloQueryResult<ReviewParameterViewQuery>> {
        return this.gql.fetch({ id: route.params.id });
    }
}
