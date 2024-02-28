import { Component } from '@angular/core';
import { UntypedFormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CreateFleetGQL } from '@ridy/admin-panel/generated/graphql';
import { COUNTRY_CODE_LIST } from '@ridy/admin-panel/src/app/country-codes';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-fleet-new',
  templateUrl: './fleet-new.component.html',
})
export class FleetNewComponent {
  form = this.fb.group({
    name: [null, Validators.required],
    phoneNumberPrefix: ['+1', Validators.required],
    phoneNumber: [null, Validators.required],
    mobileNumberPrefix: ['+1', Validators.required],
    mobileNumber: [null, Validators.required],
    accountNumber: [null, Validators.required],
    commissionSharePercent: [0, Validators.required],
    commissionShareFlat: [0, Validators.required],
    address: [null],
  });
  countryCodes = COUNTRY_CODE_LIST;

  constructor(
    private fb: UntypedFormBuilder,
    private createRiderGQL: CreateFleetGQL,
    private messageService: NzMessageService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  async submitForm() {
    const {
      phoneNumber,
      phoneNumberPrefix,
      mobileNumber,
      mobileNumberPrefix,
      ..._formValue
    } = this.form.value;
    const result = await firstValueFrom(
      this.createRiderGQL.mutate({
        input: {
          phoneNumber: `${phoneNumberPrefix.substring(1)}${phoneNumber}`,
          mobileNumber: `${mobileNumberPrefix.substring(1)}${mobileNumber}`,
          ..._formValue,
        },
      })
    );
    if ((result.errors?.length ?? 0) > 0) {
      this.messageService.error(
        (result.errors ?? []).map((error) => error.message).join(',')
      );
    } else {
      this.messageService.success('Success');
    }
    this.router.navigateByUrl('/management/fleets');
  }
}
