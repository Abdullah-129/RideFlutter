import { Authorize, FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { Point } from "@ridy/database";
import { RegionAuthorizer } from "./region.authorizer";

@ObjectType('Region')
@Authorize(RegionAuthorizer)
export class RegionDTO {
    @IDField(() => ID)
    id!: number;
    name!: string;
    @FilterableField(() => String)
    currency!: string;
    enabled!: boolean;
    location: Point[][];
}

