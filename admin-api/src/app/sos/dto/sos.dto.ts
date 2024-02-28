import { IDField, Relation, UnPagedRelation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { Point } from "@ridy/database";
import { SOSStatus } from "@ridy/database/enums/sos-status.enum";
import { OrderDTO } from "../../order/dto/order.dto";
import { SOSActivityDTO } from "./sos-activity.dto";

@ObjectType('DistressSignal')
@UnPagedRelation('activities', () => SOSActivityDTO)
@Relation('order', () => OrderDTO, { relationName: 'request' })
export class SOSDTO {
    @IDField(() => ID)
    id: number;
    createdAt: Date;
    status: SOSStatus;
    location?: Point;
    submittedByRider!: boolean;
    requestId: number;
}