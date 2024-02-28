import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { CreateOrderGQL, DispatcherCalculateFareQuery } from '@ridy/admin-panel/generated/graphql';
import { firstValueFrom, map, Observable } from 'rxjs';
import { DispatcherService } from '../dispatcher.service';

@Component({
  selector: 'app-dispatcher-service-select',
  templateUrl: './dispatcher-service-select.component.html',
  styles: [
  ]
})
export class DispatcherServiceSelectComponent implements OnInit {
  query?: Observable<ApolloQueryResult<DispatcherCalculateFareQuery>>;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private dispatcherService: DispatcherService,
    private createOrderMutation: CreateOrderGQL
  ) {}

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.services));
  }

  async selectService(service: {id: string}) {
    const riderId = this.route.snapshot.queryParams.riderId;
    const points = this.dispatcherService.deserializePoints(this.route.snapshot.queryParams.points);
    const result = await firstValueFrom(this.createOrderMutation.mutate({riderId, points: points.map(point => point.location), addresses: points.map(point => point.address), serviceId: service.id }));
    
    this.router.navigate(['../looking'], {
      relativeTo: this.route,
      queryParams: { requestId: result.data?.createOrder.id, points: undefined, riderId: undefined }
    });
  }

}