import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ManagementSettingsComponent } from './management-settings.component';


const routes: Routes = [
  { path: '', component: ManagementSettingsComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ManagementSettingsRoutingModule { }
