import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RolesListComponent } from './roles-list/roles-list.component';
import { RoleViewComponent } from './role-view/role-view.component';
import { SharedModule } from '../../../@components/shared.module';
import { ManagementRolesRoutingModule } from './management-roles-routing.module';



@NgModule({
  declarations: [
    RolesListComponent,
    RoleViewComponent
  ],
  imports: [
    SharedModule,
    ManagementRolesRoutingModule
  ]
})
export class ManagementRolesModule { }
