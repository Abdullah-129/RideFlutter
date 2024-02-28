import { Authorize, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { CarAuthorizer } from "./car.authorizer";

@ObjectType('CarColor')
@Authorize(CarAuthorizer)
export class CarColorDTO {
    @IDField(() => ID)
    id: number;
    name: string;
}