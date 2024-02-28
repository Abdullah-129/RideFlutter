import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { TranslateService } from '@ngx-translate/core';
import { RequestActivityType, ViewOrderQuery } from '@ridy/admin-panel/generated/graphql';
import { NzTimelineItemColor } from 'ng-zorro-antd/timeline';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-request-view-activities',
  templateUrl: './request-view-activities.component.html'
})
export class RequestViewActivitiesComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewOrderQuery>>;

  constructor(
    private route: ActivatedRoute,
    private translateService: TranslateService
  ) { }

  ngOnInit(): void {
    this.query = this.route.parent?.data.pipe(map(data => data.order))
  }

  getPosition(type: RequestActivityType): ('left' | 'right') {
    switch (type) {
      case RequestActivityType.BookedByRider:
      case RequestActivityType.CanceledByRider:
      case RequestActivityType.RequestedByRider:
      case RequestActivityType.BookedByOperator:
      case RequestActivityType.CanceledByOperator:
      case RequestActivityType.RequestedByOperator:
        return 'left';

      default:
        return 'right';
    }
  }

  getColor(type: RequestActivityType): NzTimelineItemColor {
    switch (type) {
      case RequestActivityType.CanceledByDriver:
      case RequestActivityType.CanceledByRider:
      case RequestActivityType.CanceledByOperator:
      case RequestActivityType.Expired:
        return 'red';

      case RequestActivityType.RequestedByRider:
      case RequestActivityType.RequestedByOperator:
      case RequestActivityType.BookedByRider:
      case RequestActivityType.BookedByOperator:
      case RequestActivityType.DriverAccepted:
      case RequestActivityType.Paid:
        return 'green';

      case RequestActivityType.ArrivedToPickupPoint:
      case RequestActivityType.ArrivedToDestination:
      case RequestActivityType.Started:
        return 'blue';

      default:
        return 'gray';
    }
  }

  translateType(value: RequestActivityType): string {
    switch (value) {
      case RequestActivityType.ArrivedToDestination: return this.translateService.instant('requestActivityType.arrivedToDestination');
      case RequestActivityType.ArrivedToPickupPoint: return this.translateService.instant('requestActivityType.arrivedToPickupPoint');
      case RequestActivityType.BookedByOperator: return this.translateService.instant('requestActivityType.bookedByOperator');
      case RequestActivityType.BookedByRider: return this.translateService.instant('requestActivityType.bookedByRider');
      case RequestActivityType.CanceledByDriver: return this.translateService.instant('requestActivityType.canceledByDriver');
      case RequestActivityType.CanceledByOperator: return this.translateService.instant('requestActivityType.canceledByOperator');
      case RequestActivityType.CanceledByRider: return this.translateService.instant('requestActivityType.canceledByRider');
      case RequestActivityType.DriverAccepted: return this.translateService.instant('requestActivityType.driverAccepted');
      case RequestActivityType.Expired: return this.translateService.instant('requestActivityType.expired');
      case RequestActivityType.Paid: return this.translateService.instant('requestActivityType.paid');
      case RequestActivityType.RequestedByOperator: return this.translateService.instant('requestActivityType.requestedByOperator');
      case RequestActivityType.RequestedByRider: return this.translateService.instant('requestActivityType.requestedByRider');
      case RequestActivityType.Reviewed: return this.translateService.instant('requestActivityType.reviewed');
      case RequestActivityType.Started: return this.translateService.instant('requestActivityType.started');
    }
  }

  isPending(items: {type: RequestActivityType}[]): boolean {
    if(items.length == 0) return false;
    const lastItem = items[items.length - 1];
    const finished = lastItem.type == RequestActivityType.Paid || lastItem.type == RequestActivityType.Reviewed || lastItem.type == RequestActivityType.CanceledByDriver || lastItem.type == RequestActivityType.CanceledByRider || lastItem.type == RequestActivityType.CanceledByOperator;
    return !finished;
  }
}