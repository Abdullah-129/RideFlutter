import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ConfigComponent } from './config.component';
import { ConfigGuard } from './config.guard';
import { ConfigResolver } from './config-resolver';


const routes: Routes = [
  { path: '', component: ConfigComponent, canActivate: [ConfigGuard], resolve: { config: ConfigResolver } }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [ConfigGuard, ConfigResolver]
})
export class ConfigRoutingModule { }
