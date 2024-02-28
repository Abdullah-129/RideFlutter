import { AfterViewInit, Component, OnDestroy, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CreateReviewParameterGQL, CreateServiceOptionGQL, ReviewParameterViewQuery, ServiceOptionIcon, ServiceOptionType, ServiceOptionViewQuery, UpdateReviewParameterGQL, UpdateServiceOptionGQL } from '@ridy/admin-panel/generated/graphql';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, Subscription } from 'rxjs';

@Component({
  selector: 'app-service-option-view',
  templateUrl: './service-option-view.component.html'
})
export class ServiceOptionViewComponent implements OnInit, OnDestroy {
  form = this.fb.group({
    id: [null],
    name: [null, Validators.required],
    icon: [null, Validators.required],
    type: [null, Validators.required],
    additionalFee: [null]
  });
  subscription?: Subscription;
  types = Object.keys(ServiceOptionType);
  icons = Object.keys(ServiceOptionIcon);
  type = ServiceOptionType;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private fb: UntypedFormBuilder,
    private createGQL: CreateServiceOptionGQL,
    private updateGQL: UpdateServiceOptionGQL,
    private msg: NzMessageService) { }

  ngOnInit(): void {
    this.subscription = this.route.data.subscribe(data => {
      if (data.serviceOption != null) {
        const val: ServiceOptionViewQuery = data.serviceOption.data;
        const serviceOption = val.serviceOption;
        if (serviceOption != null) {
          this.form.patchValue(serviceOption);
        }
      }
    });
  }

  ngOnDestroy(): void {
    this.subscription?.unsubscribe();
  }

  async onSubmit() {
    try {
      const { id, ...update } = this.form.value;
      if (id == null) {
        await firstValueFrom(this.createGQL.mutate({ input: update }));
      } else {
        await firstValueFrom(this.updateGQL.mutate({ id, update }));
      }
      this.router.navigate(['management/service-options'], { relativeTo: this.route.root });
    } catch(error: any) {
      this.msg.error(error.message);
    }
  }
}
