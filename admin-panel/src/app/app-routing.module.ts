import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginGuard } from './@guards/login.guard';

const routes: Routes = [
  { path: 'login', loadChildren: () => import('./login/login.module').then(m => m.LoginModule) },
  { path: 'config', loadChildren: () => import('./config/config.module').then(m => m.ConfigModule) },
  { path: '', loadChildren: () => import('./cms/cms.module').then(m => m.CMSModule), canActivate: [LoginGuard] },
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
