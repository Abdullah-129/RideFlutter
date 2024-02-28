import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { OperatorViewResolver } from './operator-view.resolver';
import { UserViewDetailsComponent } from './user-view-details/user-view-details.component';
import { UserViewComponent } from './user-view.component';

const routes: Routes = [
  { path: '', component: UserViewComponent, resolve: { operator: OperatorViewResolver }, children: [
    { path: '', redirectTo: 'details', pathMatch: 'full' },
    { path: 'details', component: UserViewDetailsComponent  }
  ]}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [
    OperatorViewResolver
  ]
})
export class UserViewRoutingModule { }
