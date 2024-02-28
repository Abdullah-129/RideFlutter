import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { PaymentGatewaysQuery } from '@ridy/admin-panel/generated/graphql';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { environment } from '@ridy/admin-panel/src/environments/environment';
import { map, Observable } from 'rxjs';

@Component({
  selector: 'app-payment-gateways-list',
  templateUrl: './payment-gateways-list.component.html'
})
export class PaymentGatewaysListComponent implements OnInit {
  query?: Observable<ApolloQueryResult<PaymentGatewaysQuery>>;
  serverUrl = environment.root;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    public tableService: TableService) {
  }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.paymentGateways));
  }
  
  // ngOnInit(): void {
  //   this.route.data.subscribe(x=>{
  //     this.total = x.items.count;
  //     this.listOfData = x.items.data;
  //   });
  // }

  // async changeStatus(id: number, status: boolean) {
  //   await this.backend.saveRow('PaymentGateway', { id: id, enabled: status });
  //   this.listOfData[this.listOfData.findIndex(x=> { return x.id == id})].enabled = status;
  // }

  // async onDelete(id: number) {
  //   await this.backend.deleteRow('PaymentGateway', id);
  //   this.listOfData = this.listOfData.filter(x => x.id != id);
  // }
}
