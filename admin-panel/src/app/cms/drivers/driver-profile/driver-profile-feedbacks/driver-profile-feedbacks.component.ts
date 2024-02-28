import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { DriverFeedbacksQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-driver-profile-feedbacks',
  templateUrl: './driver-profile-feedbacks.component.html'
})
export class DriverProfileFeedbacksComponent implements OnInit {
  query?: Observable<ApolloQueryResult<DriverFeedbacksQuery>>;

  constructor(
    public tagColor: TagColorService,
    private route: ActivatedRoute,
    public tableService: TableService

    ) { }
  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.feedbacks));
  }
}
