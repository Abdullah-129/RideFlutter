import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { UpdateOperatorGQL, ViewOperatorQuery } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, map, Observable } from 'rxjs';

@Component({
  selector: 'app-user-view-details',
  templateUrl: './user-view-details.component.html'
})
export class UserViewDetailsComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ViewOperatorQuery>>;

  form = this.fb.group({
    id: [null, Validators.required],
    firstName: [null, Validators.required],
    lastName: [null, Validators.required],
    userName: [null, Validators.required],
    email: [null],
    roleId: [null, Validators.required],
    mobileNumber: [null, Validators.required]
  });

  constructor(
    private route: ActivatedRoute,
    private updateGQL: UpdateOperatorGQL,
    private router: Router,
    private fb: UntypedFormBuilder,
    private msg: NzMessageService) { }

  ngOnInit(): void {
    this.route.parent?.data.subscribe(data => this.form.patchValue(data.operator.data.operator));
    this.query = this.route.parent?.data.pipe(map(data => data.operator));
  }

  async onSubmit() {
    const { id, ...update } = this.form.value;
    const result = await firstValueFrom(this.updateGQL.mutate({id, update}));
    this.msg.success('Done!');
    this.router.navigateByUrl('/management/users');
  }
}
