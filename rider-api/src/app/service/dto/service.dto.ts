import { IDField, Relation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { Field, ID, Int, ObjectType } from "@nestjs/graphql";
import { ServicePaymentMethod } from "@ridy/database/enums/service-payment-method.enum";
import { MediaDTO } from "../../upload/media.dto";
import { ServiceOptionDTO } from "./service-option.dto";

@ObjectType('Service')
@Relation('media', () => MediaDTO, { disableRemove: true, disableUpdate: true })
@UnPagedRelation('options', () => ServiceOptionDTO, { disableRemove: true, disableUpdate: true })
export class ServiceDTO {
    @IDField(() => ID)
    id!: number;
    name!: string;
    description?: string;
    @Field(() => Int)
    personCapacity?: number;
    paymentMethod: ServicePaymentMethod;
    cost: number;
    costAfterCoupon?: number;
    cancellationTotalFee: number;
    @Field(() => Int)
    prepayPercent!: number;
    twoWayAvailable!: boolean;
}