import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { ProviderDeductTransactionType } from "@ridy/database/enums/provider-deduct-transaction-type.enum";
import { ProviderRechargeTransactionType } from "@ridy/database/enums/provider-recharge-transaction-type.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";

@ObjectType('ProviderTransaction')
export class ProviderTransactionDTO {
    @IDField(() => ID)
    id: number;
    createdAt!: Date;
    action: TransactionAction;
    deductType?: ProviderDeductTransactionType;
    rechargeType?: ProviderRechargeTransactionType;
    amount: number;
    currency: string;
    refrenceNumber?: string;
    description?: string;
    @FilterableField(() => ID)
    operatorId?: number;
    @FilterableField(() => ID)
    requestId?: number;
}