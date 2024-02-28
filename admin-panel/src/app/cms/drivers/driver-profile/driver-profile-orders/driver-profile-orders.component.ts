import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { DriverOrdersQuery, OrderStatus, RiderOrdersQuery } from '@ridy/admin-panel/generated/graphql';
import { GetRowsDto } from '@ridy/admin-panel/src/app/@models/get.rows.dto';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-driver-profile-orders',
  templateUrl: './driver-profile-orders.component.html'
})
export class DriverProfileOrdersComponent implements OnInit {
  query?: Observable<ApolloQueryResult<DriverOrdersQuery>>;
  statuses = Object.keys(OrderStatus).map(key => ({text: key, value: key}));

  constructor(
    private route: ActivatedRoute,
    public tagColor: TagColorService,
    public tableService: TableService) {
  }


  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.orders));
  }
}
