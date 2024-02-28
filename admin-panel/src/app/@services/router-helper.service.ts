import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Injectable({
    providedIn: 'root'
})
export class RouterHelperService {
    constructor(
        private router: Router
    ) {}

    refresh(route: ActivatedRoute) {
        this.router.navigate(
            [],
            {
              relativeTo: route,
              queryParams: {refresh: new Date().getTime()},
              queryParamsHandling: 'merge',
            });
    }

    goToParent(route: ActivatedRoute) {
        this.router.navigate(['.'], { relativeTo: route.parent });
    }
}