import { AfterViewInit, Component } from '@angular/core';
import { UntypedFormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CreateReviewParameterGQL, ReviewParameterViewQuery, UpdateReviewParameterGQL } from '@ridy/admin-panel/generated/graphql';
import { NzMessageService } from 'ng-zorro-antd/message';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-review-parameter-view',
  templateUrl: './review-parameter-view.component.html'
})
export class ReviewParameterViewComponent implements AfterViewInit {
  form = this.fb.group({
    id: [null],
    title: [null, Validators.required],
    isGood: [null, Validators.required],
  });

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private fb: UntypedFormBuilder,
    private createGQL: CreateReviewParameterGQL,
    private updateGQL: UpdateReviewParameterGQL,
    private msg: NzMessageService) { }

  ngAfterViewInit(): void {
    this.initializeDrawingManager();
  }

  initializeDrawingManager() {
    this.route.data.subscribe(data => {
      if (data.reviewParameter != null) {
        const val: ReviewParameterViewQuery = data.reviewParameter.data;
        const reviewParameter = val.feedbackParameter;
        if (reviewParameter != null) {
          this.form.patchValue(reviewParameter);
        }
      }
    });
  }

  async onSubmit() {
    try {
      const { id, ...update } = this.form.value;
      if (id == null) {
        await firstValueFrom(this.createGQL.mutate({ input: update }));
      } else {
        await firstValueFrom(this.updateGQL.mutate({ id, update }));
      }
      this.router.navigate(['management/review-parameters'], { relativeTo: this.route.root });
    } catch(error: any) {
      this.msg.error(error.message);
    }
    
  }
}
