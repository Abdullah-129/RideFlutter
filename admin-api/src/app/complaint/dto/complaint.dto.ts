import { FilterableField, IDField, PagingStrategies, Relation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { ComplaintStatus } from "@ridy/database/enums/complaint-status.enum";
import { OrderDTO } from "../../order/dto/order.dto";
import { ComplaintActivityDTO } from "./complaint-activity.dto";

@ObjectType('Complaint')
@UnPagedRelation('activities', () => ComplaintActivityDTO, { pagingStrategy: PagingStrategies.NONE })
@Relation('order', () => OrderDTO, { relationName: 'request' })
export class ComplaintDTO {
    @IDField(() => ID)
    id!: number;
    inscriptionTimestamp!: Date;
    requestedByDriver: boolean;
    subject: string;
    content?: string;
    @FilterableField(() => ComplaintStatus)
    status: ComplaintStatus;
    @FilterableField(() => ID)
    requestId: number;
}