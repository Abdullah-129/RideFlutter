import { Component, HostBinding } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { LoginGQL } from '@ridy/admin-panel/generated/graphql';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom } from 'rxjs';

import { loginTransition } from './login.animation';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
  animations: [loginTransition]
})
export class LoginComponent {
  @HostBinding('@loginTransition') state = 'activated';
  validateForm = this.fb.group({
    userName: [null, [Validators.required]],
    password: [null, []],
    remember: [true]
  });
  validating = false;
  passwordVisible = false;

  submitForm(): void {
    for (const i in this.validateForm.controls) {
      this.validateForm.controls[i].markAsDirty();
      this.validateForm.controls[i].updateValueAndValidity();
    }
  }

  constructor(private fb: UntypedFormBuilder, private router: Router, private message: NzMessageService, private loginGql: LoginGQL) {}

  async onLogin() {
    try {
      const username = this.validateForm.get('userName')?.value;
      const password = this.validateForm.get('password')?.value;
      const res = await firstValueFrom(this.loginGql.fetch({username, password}));
      localStorage.setItem('ridy_admin_token', res.data.login.token);
      this.router.navigate([''], {});
    } catch(exception: any) {
      this.message.error(exception.message);
      this.validateForm.controls['password'].setErrors({'incorrect': true});
    }
  }
}
