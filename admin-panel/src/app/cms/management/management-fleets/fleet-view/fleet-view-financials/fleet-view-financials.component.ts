import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { CreateFleetTransactionGQL, FleetFinancialsQuery, ProviderDeductTransactionType, ProviderRechargeTransactionType } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, map, Observable } from 'rxjs';

@Component({
  selector: 'app-fleet-view-financials',
  templateUrl: './fleet-view-financials.component.html'
})
export class FleetViewFinancialsComponent implements OnInit {
  query?: Observable<ApolloQueryResult<FleetFinancialsQuery>>;
  formTransaction = this.fb.group({
    action: [null, Validators.required],
    rechargeType: [null],
    deductType: [null],
    amount: [0, Validators.required],
    currency: [null, Validators.required],
    description: [null],
    refrenceNumber: [null]
  });
  deductTypes = Object.keys(ProviderDeductTransactionType);
  rechargeTypes = Object.keys(ProviderRechargeTransactionType);
  
  constructor(
    private route: ActivatedRoute,
    public tagColor: TagColorService,
    public tableService: TableService,
    private fb: UntypedFormBuilder,
    private msg: NzMessageService,
    private routerHelper: RouterHelperService,
    private createTransactionGQL: CreateFleetTransactionGQL) { }

  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.financials)); 
  }

  getUniquieCurrencies(currencies: {currency: string}[] | undefined) {
    if(currencies == undefined) return [];
    return [...new Set(currencies)];
  }
  
  async onSubmitTransaction() {
    this.formTransaction.value.fleetId = this.route.parent?.snapshot.params.id;
    if(this.formTransaction.value.action == 'Deduct' && this.formTransaction.value.deductType == null) {
      this.msg.error('Please select the transaction type.');
      return;
    }
    if(this.formTransaction.value.action == 'Recharge' && this.formTransaction.value.rechargeType == null) {
      this.msg.error('Please select the transaction type.');
      return;
    }
    try {
      await firstValueFrom(this.createTransactionGQL.mutate({input: this.formTransaction.value}));
      this.msg.success('Transaction Submitted.');
      this.routerHelper.refresh(this.route);
      this.formTransaction.patchValue({});
    } catch(error: any) {
      this.msg.error(error.message);
    }
  }
}
