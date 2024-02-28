import { Injectable } from '@angular/core';
import { ComplaintStatus, DriverStatus, OrderStatus, RiderStatus, SosStatus, TransactionStatus } from '@ridy/admin-panel/generated/graphql';
import { stat } from 'fs';
import { NzStatusColor } from 'ng-zorro-antd/core/color';

@Injectable()
export class TagColorService {

  getTransactionStatusStatusColor(status: TransactionStatus): NzStatusColor {
    switch (status) {
      case (TransactionStatus.Processing):
        return 'processing';
      case (TransactionStatus.Canceled):
        return 'warning';
      case (TransactionStatus.Done):
        return 'success';
      case (TransactionStatus.Rejected):
        return 'error';
    }
  }

  orderStatus(value: OrderStatus): NzStatusColor {
    switch (value) {
      case (OrderStatus.Expired):
        return 'default';

      case (OrderStatus.RiderCanceled):
      case (OrderStatus.DriverCanceled):
      case (OrderStatus.NotFound):
      case (OrderStatus.NoCloseFound):
        return 'error';

      case (OrderStatus.Booked):
        return 'warning';

      case (OrderStatus.Finished):
        return 'success';

      default:
        return 'processing';
    }
  }

  boolean(value: boolean): NzStatusColor {
    return value ? 'success' : 'error';
  }

  driver(value: DriverStatus): NzStatusColor {
    switch (value) {
      case (DriverStatus.Blocked):
      case (DriverStatus.HardReject):
        return 'error';

      case (DriverStatus.Online):
        return 'processing';

      case (DriverStatus.InService):
        return 'success'

      case (DriverStatus.WaitingDocuments):
      case (DriverStatus.SoftReject):
      case (DriverStatus.Offline):
        return 'default';

      case (DriverStatus.PendingApproval):
        return 'warning';
    }
  }

  rider(value: RiderStatus): NzStatusColor {
    switch (value) {
      case (RiderStatus.Disabled):
        return 'error';

      case (RiderStatus.Enabled):
        return 'success';
    }
  }

  complaintStatus(status: ComplaintStatus): NzStatusColor {
    switch(status) {
      case(ComplaintStatus.Resolved):
      return 'success';

      case(ComplaintStatus.Submitted):
      return 'warning';

      case(ComplaintStatus.UnderInvestigation):
      return 'processing';
    }
  }

  sosStatus(status: SosStatus): NzStatusColor {
    switch(status) {
      case SosStatus.Resolved:
        return 'success';

      case SosStatus.Submitted:
        return 'warning';

      case SosStatus.FalseAlarm:
        return 'default';

      case SosStatus.UnderReview:
        return 'processing';
    }
  }

  // requestBadge(value: RequestStatus) {
  //   switch (value) {
  //     case (RequestStatus.RiderCanceled):
  //     case (RequestStatus.DriverCanceled):
  //     case (RequestStatus.NotFound):
  //     case (RequestStatus.NoCloseFound):
  //     case (RequestStatus.Expired):
  //       return 'error';

  //     case (RequestStatus.Booked):
  //     case (RequestStatus.Started):
  //     case (RequestStatus.WaitingForPostPay):
  //     case (RequestStatus.WaitingForReview):
  //       return 'processing';

  //     case (RequestStatus.Finished):
  //       return 'success';

  //     default:
  //       return 'default';
  //   }

  // }
}
