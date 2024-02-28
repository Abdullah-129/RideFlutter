import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { ExportGQL, ExportTable, ExportType, RiderWalletsListQuery } from '@ridy/admin-panel/generated/graphql';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { NzTableFilterList } from 'ng-zorro-antd/table';
import { firstValueFrom, map, Observable } from 'rxjs';
import { TableService } from '../../../@services/table-service';

@Component({
  selector: 'app-rider-wallets',
  templateUrl: './rider-wallets-list.component.html'
})
export class RiderWalletsListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<RiderWalletsListQuery>>;
  amountRange: number[] = [-1,-1];
  currencies?: Observable<NzTableFilterList>;

  constructor(
    private route: ActivatedRoute,
    public tableService: TableService,
    private exportGql: ExportGQL
  ) { }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.riderWallet));
    this.currencies = this.query.pipe(map(data => this.distinctCurrency(data.data.regions.nodes).map(currency => ({ text: currency, value: currency }))))
  }
  
  async exportTo(type: string) {
    const result = await firstValueFrom(this.exportGql.fetch({input: {table: ExportTable.RiderWallet, type: ExportType.Csv, relations: ['rider']}}));
    this.tableService.downloadURI(environment.root + result.data.export.url, `export-${new Date().getTime()}.csv`);
  }

  distinctCurrency(array: {currency: string}[]): string[] {
    return array.map(item => item.currency).filter((v, i, a) => a.indexOf(v) === i);
  }
}
