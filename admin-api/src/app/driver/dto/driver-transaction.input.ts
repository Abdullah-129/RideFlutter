import { Field, ID, InputType } from "@nestjs/graphql";
import { DriverDeductTransactionType } from "@ridy/database/enums/driver-deduct-transaction-type.enum";
import { DriverRechargeTransactionType } from "@ridy/database/enums/driver-recharge-transaction-type.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";

@InputType()
export class DriverTransactionInput {
    action: TransactionAction;
    deductType?: DriverDeductTransactionType;
    rechargeType?: DriverRechargeTransactionType;
    amount: number;
    currency: string;
    refrenceNumber?: string;
    @Field(() => ID)
    driverId!: number;
    description?: string;
}