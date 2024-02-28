import { FilterableField, IDField, Relation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { ProviderDeductTransactionType } from "@ridy/database/enums/provider-deduct-transaction-type.enum";
import { ProviderRechargeTransactionType } from "@ridy/database/enums/provider-recharge-transaction-type.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";
import { OperatorDTO } from "../../operator/dto/operator.dto";

@ObjectType('FleetTransaction')
@Relation('operator', () => OperatorDTO, { nullable: true })
export class FleetTransactionDTO {
    @IDField(() => ID)
    id: number;
    transactionTimestamp!: Date;
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
    @FilterableField(() => ID)
    fleetId: number;
}