import { IDField, Relation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { SOSActivityAction } from "@ridy/database/enums/sos-activity-action.enum";
import { OperatorDTO } from "../../operator/dto/operator.dto";

@ObjectType('SOSActivity')
@Relation('operator', () => OperatorDTO)
export class SOSActivityDTO {
    @IDField(() => ID)
    id: number;
    createdAt: Date;
    action: SOSActivityAction;
    note?: string;
    operatorId?: number;
}