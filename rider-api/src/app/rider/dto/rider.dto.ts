import { ID, ObjectType } from '@nestjs/graphql';
import {
  Authorize,
  BeforeFindOne,
  FindOneArgsType,
  IDField,
  Relation,
  UnPagedRelation,
} from '@nestjs-query/query-graphql';
import { Gender } from '@ridy/database/enums/gender.enum';
import { UserContext } from '../../auth/authenticated-user';
import { MediaDTO } from '../../upload/media.dto';
import { CouponDTO } from '../../coupon/dto/coupon.dto';
import { OrderDTO } from '../../order/dto/order.dto';
import { SortDirection } from '@nestjs-query/core';
import { OrderStatus } from '@ridy/database/enums/order-status.enum';
import { RiderDocumentType } from '@ridy/database/enums/rider-document-type';

@ObjectType('Rider')
@Authorize({
  authorize: (context: UserContext) => ({ id: { eq: context.req.user.id } }),
})
@BeforeFindOne((input: FindOneArgsType, context: UserContext) => {
  return { id: context.req.user.id };
})
@Relation('media', () => MediaDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('coupons', () => CouponDTO, {
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('orders', () => OrderDTO, {
  disableRemove: true,
  disableUpdate: true,
  maxResultsSize: 1,
  defaultFilter: {
    status: {
      in: [
        OrderStatus.Requested,
        OrderStatus.Booked,
        OrderStatus.Found,
        OrderStatus.NotFound,
        OrderStatus.NoCloseFound,
        OrderStatus.DriverAccepted,
        OrderStatus.Arrived,
        OrderStatus.Started,
        OrderStatus.WaitingForReview,
        OrderStatus.WaitingForPostPay,
        OrderStatus.WaitingForPrePay,
      ],
    },
  },
  defaultSort: [{ field: 'id', direction: SortDirection.DESC }],
  defaultResultSize: 1,
  enableAggregate: true,
})
export class RiderDTO {
  @IDField(() => ID)
  id!: number;
  mobileNumber: string;
  firstName?: string;
  lastName?: string;
  email?: string;
  gender?: Gender;
  isResident?: boolean;
  idNumber?: string;
  documentType?: RiderDocumentType;
}
