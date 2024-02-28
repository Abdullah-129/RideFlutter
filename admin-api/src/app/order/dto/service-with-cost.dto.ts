import { IDField, Relation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { MediaDTO } from "../../upload/media.dto";

@ObjectType('ServiceWithCost')
export class ServiceWithCostDTO {
    @IDField(() => ID)
    id: number;
    name: string;
    cost: number;
    media: MediaDTO;
}