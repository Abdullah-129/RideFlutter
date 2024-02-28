import { FilterableField, IDField, Relation } from '@nestjs-query/query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
import { RiderDeductTransactionType } from '@ridy/database/enums/rider-deduct-transaction-type.enum';
import { RiderRechargeTransactionType } from '@ridy/database/enums/rider-recharge-transaction-type.enum';
import { TransactionAction } from '@ridy/database/enums/transaction-action.enum';
import { TransactionStatus } from '@ridy/database/enums/transaction-status.enum';

import { OperatorDTO } from '../../operator/dto/operator.dto';
import { PaymentGatewayDTO } from '../../payment-gateway/dto/payment-gateway.dto';
import { RiderDTO } from './rider.dto';

@ObjectType('RiderTransaction')
@Relation('operator', () => OperatorDTO, { nullable: true })
@Relation('paymentGateway', () => PaymentGatewayDTO, { nullable: true })
@Relation('rider', () => RiderDTO)
export class RiderTransactionDTO {
    @IDField(() => ID)
    id: number;
    action: TransactionAction;
    @FilterableField()
    createdAt: Date;
    deductType?: RiderDeductTransactionType;
    rechargeType?: RiderRechargeTransactionType;
    status: TransactionStatus;
    @FilterableField(() => Float)
    amount: number;
    @FilterableField(() => String)
    currency: string;
    refrenceNumber?: string;
    description?: string;
    @FilterableField(() => ID)
    riderId!: number;
    @Field(() => ID)
    paymentGatewayId?: number;
    @Field(() => ID)
    operatorId?: number;
    @Field(() => ID)
    requestId?: number;
}