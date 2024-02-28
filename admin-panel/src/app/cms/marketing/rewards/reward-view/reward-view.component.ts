import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { ApolloQueryResult } from '@apollo/client/core';
import { CreateRewardGQL, UpdateRewardGQL, ViewRewardQuery } from '@ridy/admin-panel/generated/graphql';
import { RouterHelperService } from '@ridy/admin-panel/src/app/@services/router-helper.service';
import { CURRENCY_LIST } from '@ridy/admin-panel/src/app/currencies';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-reward-view',
  templateUrl: './reward-view.component.html',
  styles: [
    'nz-input-number{ @apply w-full }',
  ]
})
export class RewardViewComponent implements OnInit {
  form = this.fb.group({
    id: [null],
    title: [null, Validators.required],
    dates: [null, Validators.required],
    appType: [null, Validators.required],
    beneficiary: [null, Validators.required],
    event: [null, Validators.required],
    creditGift: [0, Validators.required],
    tripFeePercentGift: [0, Validators.required],
    creditCurrency: [null],
    conditionTripCountsLessThan: [null],
    conditionUserNumberFirstDigits: [null]
  });
  currencies = CURRENCY_LIST;

  constructor(
    private route: ActivatedRoute,
    private message: NzMessageService,
    private fb: UntypedFormBuilder,
    private routerHelper: RouterHelperService,
    private createGQL: CreateRewardGQL,
    private updateGQL: UpdateRewardGQL) { }

  ngOnInit(): void {
    this.route.data.subscribe(data => {
      if(data.reward == null) return;
      data.reward.data.reward.dates = [data.reward.data.reward.startDate, data.reward.data.reward.endDate];
      this.form.patchValue(data.reward.data.reward);

    });
  }

  async onSubmit() {
    const {id, dates, conditionUserNumber, ..._input} = this.form.value;
    const startDate = dates[0].getTime();
    const endDate = dates[1].getTime();
    const conditionUserNumberFirstDigits = conditionUserNumber != null && conditionUserNumber.length > 0 ? conditionUserNumber.split(',') : null;
    const input = {..._input, startDate, endDate, conditionUserNumberFirstDigits};
    try {
      if(id == null) {
        await firstValueFrom(this.createGQL.mutate({input}));
      } else {
        await firstValueFrom(this.updateGQL.mutate({id, input}));
      }
    this.routerHelper.goToParent(this.route);
    } catch(error: any) {
      this.message.error(error.message);
    }
  }
}
