import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import {
  CarsListQuery,
  CreateCarColorGQL,
  CreateCarModelGQL,
  DeleteCarColorGQL,
  DeleteCarModelGQL,
  UpdateCarColorGQL,
  UpdateCarModelGQL,
} from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { firstValueFrom, map, Observable } from 'rxjs';

@Component({
  selector: 'app-management-cars-list',
  templateUrl: './management-cars-list.component.html'
})
export class ManagementCarsListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<CarsListQuery>>;
  editId?: string;
  editColorId?: string;

  constructor(
    private route: ActivatedRoute,
    private routerHelper: RouterHelperService,
    public tableService: TableService,
    private deleteCarModelGQL: DeleteCarModelGQL,
    private deleteCarColorGQL: DeleteCarColorGQL,
    private updateCarModelGQL: UpdateCarModelGQL,
    private updateCarColorGQL: UpdateCarColorGQL,
    private createCarModelGQL: CreateCarModelGQL,
    private createCarColorGQL: CreateCarColorGQL) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.cars));
  }

  startEdit(id: string, event: MouseEvent): void {
    event.preventDefault();
    event.stopPropagation();
    this.editId = id;
  }

  async onSubmitEditModel(id: string, name: string) {
    const res = await firstValueFrom(this.updateCarModelGQL.mutate({ id, input: {name}}));
    this.editId = undefined;
  }

  async onAddModel() {
    const res = await firstValueFrom(this.createCarModelGQL.mutate({ input: { name: '' } }));
    this.routerHelper.refresh(this.route);
  }

  async onDeleteModel(id: string) {
    const result = await firstValueFrom(this.deleteCarModelGQL.mutate({ id }));
    this.routerHelper.refresh(this.route);
  }

  startEditColor(id: string, event: MouseEvent): void {
    event.preventDefault();
    event.stopPropagation();
    this.editColorId = id;
  }

  async onSubmitEditColor(id: string, title: string) {
    const res = await firstValueFrom(this.updateCarColorGQL.mutate({ id, input: {name: title}}));
    this.editColorId = undefined;
  }

  async onAddColor() {
    const res = await firstValueFrom(this.createCarColorGQL.mutate({ input: { name: '' } }));
    this.routerHelper.refresh(this.route);
  }

  async onDeleteColor(id: string) {
    const result = await firstValueFrom(this.deleteCarColorGQL.mutate({ id }));
    this.routerHelper.refresh(this.route);
  }
}