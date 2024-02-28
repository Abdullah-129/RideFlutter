import { IDField, Relation } from "@nestjs-query/query-graphql";
import { Field, ID, Int, ObjectType } from "@nestjs/graphql";
import { MediaDTO } from "../../upload/media.dto";
import { CarColorDTO } from "./car-color.dto";
import { CarModelDTO } from "./car-model.dto";

@ObjectType('Driver')
@Relation('car', () => CarModelDTO, { nullable: true, disableRemove: true, disableUpdate: true })
@Relation('carColor', () => CarColorDTO, { nullable: true, disableRemove: true, disableUpdate: true })
@Relation('media', () => MediaDTO, { nullable: true, disableRemove: true, disableUpdate: true })
export class DriverDTO {
    @IDField(() => ID)
    id: number;
    mobileNumber: string;
    firstName?: string;
    carPlate?: string;
    lastName?: string;
    @Field(() => Int)
    rating?: number;
    reviewCount: number;
}