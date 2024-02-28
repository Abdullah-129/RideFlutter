import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { NzMessageService } from 'ng-zorro-antd/message';
import { TranslateService } from '@ngx-translate/core';
import { UpdatePasswordGQL } from '@ridy/admin-panel/generated/graphql';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-management-settings',
  templateUrl: './management-settings.component.html'
})
export class ManagementSettingsComponent implements OnInit {
  form = this.fb.group({
    oldPassword: [null, Validators.required],
    newPassword: [null, Validators.required],
    newPasswordRepeat: [null, Validators.required]
  });
  constructor(
    private route: ActivatedRoute,
    private message: NzMessageService,
    private updatePasswordGql: UpdatePasswordGQL,
    private fb: UntypedFormBuilder,
    private translate: TranslateService) { }

  ngOnInit(): void {}

  async onSubmit() {
    if(this.form.value.newPassword != this.form.value.newPasswordRepeat) {
      this.message.error('Passwords don\'t match.');
      return;
    }
    try {
      await firstValueFrom(this.updatePasswordGql.mutate({input: {oldPassword: this.form.value.oldPassword, newPasswod: this.form.value.newPassword}}));
      this.message.success('Password Updated Successfully.');
      this.form.reset();
    } catch(error) {
      this.message.error('Action is not allowed.');
    }
  }
}
