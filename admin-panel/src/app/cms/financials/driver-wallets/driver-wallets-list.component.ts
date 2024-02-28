import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { DriverWalletsListQuery, ExportGQL, ExportTable, ExportType } from '@ridy/admin-panel/generated/graphql';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { NzTableFilterList } from 'ng-zorro-antd/table';
import { firstValueFrom, map, Observable } from 'rxjs';
import { TableService } from '../../../@services/table-service';

@Component({
  selector: 'app-driver-wallets-list',
  templateUrl: './driver-wallets-list.component.html'
})
export class DriverWalletsListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<DriverWalletsListQuery>>;
  amountRange: number[] = [-1,-1];
  currencies?: Observable<NzTableFilterList>;

  constructor(
    private route: ActivatedRoute,
    private exportGql: ExportGQL,
    public tableService: TableService
  ) { }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.driverWallet));
    this.currencies = this.query.pipe(map(data => this.distinctCurrency(data.data.regions.nodes).map(currency => ({ text: currency, value: currency }))))
  }
  
  async exportTo(type: string) {
    const result = await firstValueFrom(this.exportGql.fetch({input: {table: ExportTable.DriverWallet, type: ExportType.Csv, relations: ['driver']}}));
    this.tableService.downloadURI(environment.root + result.data.export.url, `export-${new Date().getTime()}.csv`);
  }

  distinctCurrency(array: {currency: string}[]): string[] {
    return array.map(item => item.currency).filter((v, i, a) => a.indexOf(v) === i);
  }
}
