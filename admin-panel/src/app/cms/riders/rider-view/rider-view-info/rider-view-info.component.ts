import { Component, OnDestroy, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { UpdateRiderGQL } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, Subscription } from 'rxjs';

@Component({
  selector: 'app-rider-view-info',
  templateUrl: './rider-view-info.component.html'
})
export class RiderViewInfoComponent implements OnInit, OnDestroy {
  form = this.fb.group({
    id: [null, Validators.required],
    firstName: [null, Validators.required],
    lastName: [null, Validators.required],
    mobileNumber: [null, Validators.required],
    gender: [null],
    email: [null],
    isResident: [null],
    idNumber: [null]
  });
  valObserver?: Subscription;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private fb: UntypedFormBuilder,
    private updateRiderGQL: UpdateRiderGQL,
    private routerHelper: RouterHelperService,
    private msg: NzMessageService) { }

  ngOnDestroy(): void {
    this.valObserver?.unsubscribe();
  }

  ngOnInit(): void {
    this.valObserver = this.route.parent?.data.subscribe(data => this.form.patchValue(data.rider.data.rider));
  }

  async onSubmit() {
    const {id, mobileNumber,...update } = this.form.value;
    try {
      const result = await firstValueFrom(this.updateRiderGQL.mutate({ id, update }));
      this.msg.success('Updated!');
      this.routerHelper.refresh(this.route);
    } catch(exception) {
      console.log(exception);
    }
  }
}
