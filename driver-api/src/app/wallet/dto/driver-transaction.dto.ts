import { Authorize, FilterableField, IDField } from '@nestjs-query/query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { DriverDeductTransactionType } from '@ridy/database/enums/driver-deduct-transaction-type.enum';
import { DriverRechargeTransactionType } from '@ridy/database/enums/driver-recharge-transaction-type.enum';
import { TransactionAction } from '@ridy/database/enums/transaction-action.enum';

import { UserContext } from '../../auth/authenticated-user';

@ObjectType("DriverTransacion")
@Authorize({
    authorize: (context: UserContext) => ({driverId: {eq: context.req.user.id}})
})
export class DriverTransactionDTO {
    @IDField(() => ID)
    id: number;
    createdAt: Date;
    action: TransactionAction;
    deductType?: DriverDeductTransactionType;
    rechargeType?: DriverRechargeTransactionType;
    amount!: number;
    currency: string;
    refrenceNumber?: string;
    @FilterableField(() => ID, { filterOnly: true })
    driverId: number;
}