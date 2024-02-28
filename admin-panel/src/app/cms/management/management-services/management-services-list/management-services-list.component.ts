import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ServicesListQuery } from '@ridy/admin-panel/generated/graphql';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-management-services-list',
  templateUrl: './management-services-list.component.html'
})
export class ManagementServicesListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<ServicesListQuery>>;
  lastNameSearchValue = "";
  selectedCategory?: number;
  serverUrl = environment.root;

  constructor(
    private route: ActivatedRoute,
    public tagColor: TagColorService) {}

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.services));
  }

  // async searchData(reset: boolean = false, params: Params = this.queryParams): Promise<void> {
  //   if (reset) {
  //     this.pageIndex = 1;
  //   }
  //   let as = Object.assign(params, {page: this.pageIndex == 1 ? null : this.pageIndex, pageSize: this.pageSize == 10 ? null : this.pageSize});
  //   this.router.navigate(
  //     [],
  //     {
  //       relativeTo: this.route,
  //       queryParams: as,
  //       queryParamsHandling: 'merge',
  //     });
  // }

  // ngOnInit(): void {
  //   this.route.data.subscribe(x=>{
  //     this.total = x.items.count;
  //     this.listOfData = x.items.data;
  //     this.selectedCategory = 0;
  //   });
  // }

  // async changeStatus(id: number, status: boolean) {
  //   await this.backend.saveRow('Service', {id: id, enabled: status});
  //   //this.listOfData[this.listOfData.findIndex(x=> { return x.id == id})].enabled = status;
  // }

  // async deleteCategory(cat: ServiceCategory) {
  //   await this.backend.deleteRow('ServiceCategory', cat.id);
  //   this.router.navigate([], { queryParams: {refresh: new Date().getTime()}})
  // }

  // async onDelete(serviceId: number) {
  //   await this.backend.deleteRow('Service', serviceId);
  //   this.router.navigate([], { queryParams: {refresh: new Date().getTime()}})
  // }

}