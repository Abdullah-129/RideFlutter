import { Injectable } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { OffsetPaging, StringFieldComparison } from '@ridy/admin-panel/generated/graphql';
import { NzTableQueryParams } from 'ng-zorro-antd/table';

@Injectable({
  providedIn: 'root'
})
export class TableService {
  constructor(private router: Router, private route: ActivatedRoute) { }

  private serializeQueryParams(params: NzTableQueryParams, routeParams: { pageIndex: string, pageSize: string, filter: string, sort: string }) {
    // console.log(params);
    // console.log(this.deserializeQueryParams(routeParams));
    const obj: any = {};
    obj['pageIndex'] = params.pageIndex;
    obj['pageSize'] = params.pageSize;
    if (params.filter != null) {
      const filterArray = params.filter.filter(val => val.value != null && val.value.length > 0).map(filt => `${filt.key}|${Array.isArray(filt.value) ? 'in' : 'eq'}|${Array.isArray(filt.value) ? filt.value.join('-') : filt.value}`);
      if (routeParams.filter != null) {
        filterArray.push(...routeParams.filter.split(','));
      }
      obj['filter'] = filterArray.length > 0 ? filterArray.join(',') : undefined;
    }
    if (params.sort != null && params.sort.length > 0) {

      const sortArray = params.sort.filter(val => val.value != null).map(val => `${val.key}|${val.value == 'ascend' ? 'ASC' : 'DESC'}`);
      if (routeParams.sort != null) {
        sortArray.push(...routeParams.sort.split(','));
      }
      obj['sort'] = sortArray.length > 0 ? sortArray.join(',') : undefined;
    }
    return obj;
  }

  onTableQueryParamsChange(params: NzTableQueryParams): void {
    const param = this.serializeQueryParams(params, this.route.snapshot.queryParams as unknown as any);
    this.router.navigate(
      [],
      {
        relativeTo: this.route,
        queryParams: param,
        queryParamsHandling: 'merge',
      });
  }

  filterText(key: string, value: string | undefined) {
    const nz = this.deserializeQueryParams<any, any>(this.route);
    const baseFilter = nz.filter ?? {};
    if (value != undefined) {
      baseFilter[key] = { like: value };
    } else {
      baseFilter[key] = {};
    }
    const filters = Object.keys(baseFilter).map(key => {
      if (Object.keys(baseFilter[key]).length < 1) {
        return null;
      }
      const action = Object.keys(baseFilter[key])[0];
      const value = action == 'in' ? baseFilter[key][action].join('-') : baseFilter[key][action];
      return `${key}|${action}|${value}`;
    }).filter(fil => fil != null);
    const filter = filters.length > 0 ? filters.join(',') : undefined;
    this.router.navigate(
      [],
      {
        relativeTo: this.route,
        queryParams: { filter },
        queryParamsHandling: 'merge',
      });
  }

  filterRange(key: string, range: number[] | undefined) {
    const nz = this.deserializeQueryParams<any, any>(this.route);
    const baseFilter = nz.filter ?? {};
    if (range != undefined) {
      baseFilter[key] = { between: range };
    } else {
      baseFilter[key] = {};
    }
    const filters = Object.keys(baseFilter).map(key => {
      if (Object.keys(baseFilter[key]).length < 1) {
        return null;
      }
      const action = Object.keys(baseFilter[key])[0];
      const value = (action == 'in' || action == 'between') ? baseFilter[key][action].join('-') : baseFilter[key][action];

      return `${key}|${action}|${value}`;
    }).filter(fil => fil != null);
    const filter = filters.length > 0 ? filters.join(',') : undefined;
    this.router.navigate(
      [],
      {
        relativeTo: this.route,
        queryParams: { filter },
        queryParamsHandling: 'merge',
      });
  }

  resetFilter(key: string, input: HTMLInputElement) {
    this.filterText(key, undefined);
    input.value = '';
  }


  downloadURI(uri: string, name: string) {
    const link = document.createElement("a");
    link.download = name;
    link.href = uri;
    link.target = '_blank';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
  }

  deserializeQueryParams<SortType, FilterType>(queryParams: any): { sorting?: TableSortItem<SortType>[], paging: OffsetPaging, filter?: FilterType } {
    const sorting = queryParams.sort ? queryParams.sort.split(',').map((sItem: string) => ({ field: sItem.split('|')[0] as unknown as SortType, direction: sItem.split('|')[1] as SortDirection })) : [];
    const filter: any = {};
    if (queryParams.filter != null) {
      queryParams.filter.split(',').forEach((item: string) => {
        const operation: any = {};
        const operationType = item.split('|')[1];
        if (operationType == 'in') {
          const operationValue = item.split('|')[2].split('-');
          operation[operationType] = operationValue;
        } else if (operationType == 'between') {
          const operationValue = item.split('|')[2].split('-');
          operation[operationType] = { lower: operationValue[0], upper: operationValue[1] };
        } else {
          operation[operationType] = item.split('|')[2];
        }
        filter[item.split('|')[0]] = operation;
      })
    }
    const pageIndex = queryParams.pageIndex != null ? parseInt(queryParams.pageIndex) : 1;
    const pageSize = queryParams.pageSize != null ? parseInt(queryParams.pageSize) : 10;
    return {
      sorting: sorting.length > 0 ? sorting : undefined,
      paging: {
        offset: ((pageIndex - 1) * pageSize) ?? undefined,
        limit: pageSize
      },
      filter: (filter != null && Object.keys(filter).length > 0) ? filter : undefined
    }
  }

}

class TableSortItem<T> {
  field!: T;
  direction!: SortDirection;
}

enum SortDirection {
  Asc = 'ASC',
  Desc = 'DESC'
}