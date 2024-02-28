import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ViewDriverQuery } from '@ridy/admin-panel/generated/graphql';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-driver-profile-documents',
  templateUrl: './driver-profile-documents.component.html'
})
export class DriverProfileDocumentsComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewDriverQuery>>;
  root = environment.root;
  constructor(private route: ActivatedRoute) { }

  ngOnInit(): void {
    this.query = this.route.parent?.data.pipe(map(data => data.driver));
  }

}
