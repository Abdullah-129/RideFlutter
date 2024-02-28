import { Component, OnInit } from '@angular/core';
import { UntypedFormGroup, Validators, UntypedFormBuilder, FormGroup, FormBuilder } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { CreateDriverGQL, } from '@ridy/admin-panel/generated/graphql';
import { firstValueFrom } from 'rxjs';
import { RouterHelperService } from '../../../@services/router-helper.service';
import { COUNTRY_CODE_LIST } from '../../../country-codes';

@Component({
  selector: 'app-driver-new',
  templateUrl: './driver-new.component.html'
})
export class DriverNewComponent {

  form: FormGroup = this.fb.group({
    firstName: null,
    lastName: null,
    phoneNumber: this.fb.group({
      prefix: '+1',
      number: null
    }),
    gender: null
  });

  countryCodes = COUNTRY_CODE_LIST;

  constructor(private fb: FormBuilder,
    private createGQL: CreateDriverGQL,
    private routerHelper: RouterHelperService,
    private route: ActivatedRoute) { }

  async submitForm() {
    const { phoneNumber, ..._formValue } = this.form.value;
    console.log(JSON.stringify(phoneNumber));
    await firstValueFrom(this.createGQL.mutate({ input: { mobileNumber: `${phoneNumber.prefix}${phoneNumber.number}`, ..._formValue } }));
    this.routerHelper.goToParent(this.route);
  }

}