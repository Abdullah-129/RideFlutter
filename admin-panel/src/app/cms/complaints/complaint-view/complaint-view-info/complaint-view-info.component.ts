import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewComplaintQuery } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { map, Observable } from 'rxjs';
import { camelCase } from "camel-case";

@Component({
  selector: 'app-complaint-view-info',
  templateUrl: './complaint-view-info.component.html'
})
export class ComplaintViewInfoComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewComplaintQuery>>;
  public camelCase = camelCase;


  constructor(
    private route: ActivatedRoute,
    public tagColor: TagColorService) {}

  ngOnInit(): void {
    this.query = this.route.parent?.data.pipe(map(data => data.complaint));
    

  }

}
