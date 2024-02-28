import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { CreateDriverTransactionGQL, DriverDeductTransactionType, DriverFinancialsQuery, DriverRechargeTransactionType, RiderRechargeTransactionType } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { TableService } from '@ridy/admin-panel/src/app/@services/table-service';
import { TagColorService } from '@ridy/admin-panel/src/app/@services/tag-color/tag-color.service';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom, map, Observable } from 'rxjs';

@Component({
  selector: 'app-driver-profile-financial',
  templateUrl: './driver-profile-financial.component.html'
})
export class DriverProfileFinancialComponent implements OnInit {
  formTransaction = this.fb.group({
    action: [null, Validators.required],
    rechargeType: [null],
    deductType: [null],
    amount: [0, Validators.required],
    currency: [null, Validators.required],
    description: [null],
    refrenceNumber: [null]
  });
  query?: Observable<ApolloQueryResult<DriverFinancialsQuery>>;
  deductTypes = Object.values(DriverDeductTransactionType);
  rechargeTypes = Object.values(DriverRechargeTransactionType);

  constructor(
    private route: ActivatedRoute,
    public tableService: TableService,
    public tagColor: TagColorService,
    private fb: UntypedFormBuilder,
    private createTransactionGQL: CreateDriverTransactionGQL,
    private routerHelper: RouterHelperService,
    private msg: NzMessageService) {
   }
  ngOnInit(): void {
    this.query = this.route.data.pipe(map(data => data.financials));
  }

  async onSubmitTransaction() {
    if(this.formTransaction.value.action == 'Recharge' && this.formTransaction.value.rechargeType == null) {
      this.msg.error('Please select the transaction type.');
      return;
    }
    if(this.formTransaction.value.action == 'Deduct' && this.formTransaction.value.deductType == null) {
      this.msg.error('Please select the transaction type.');
      return;
    }
    this.formTransaction.value.driverId = this.route.parent?.snapshot.params.id;
    try {
      await firstValueFrom(this.createTransactionGQL.mutate({input: this.formTransaction.value}));
      this.msg.success('Transaction Submitted.');
      this.routerHelper.refresh(this.route);
      this.formTransaction.patchValue({});
    } catch(error: any) {
      this.msg.error(error.message);
    }
  }

  getUniquieCurrencies(currencies: {currency: string}[] | undefined) {
    if(currencies == undefined) return [];
    return [...new Set(currencies)];
  }
}
