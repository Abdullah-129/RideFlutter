import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { CurrentConfigurationGQL } from '@ridy/admin-panel/generated/graphql';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom } from 'rxjs';

@Injectable()
export class ConfigGuard implements CanActivate {
  constructor( 
    private router: Router,
    private msg: NzMessageService,
    private currentConfigGql: CurrentConfigurationGQL,
    ) { }

  async canActivate(next: ActivatedRouteSnapshot, state: RouterStateSnapshot): Promise<boolean | UrlTree> {
    const result = await firstValueFrom(this.currentConfigGql.fetch({}));
    if(result.data.currentConfiguration.firebaseProjectPrivateKey == null) {
      return true;
    } else {
      this.msg.warning('System is already configured. Try with admin password parameter');
      this.router.navigate(['../login']);
      return false;
    }
  }

}
