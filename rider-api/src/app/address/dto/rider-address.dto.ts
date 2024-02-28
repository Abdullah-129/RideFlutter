import { Authorize, BeforeFindOne, FilterableField, FindOneArgsType, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { Point } from "@ridy/database";
import { RiderAddressType } from "@ridy/database/enums/rider-address-type.enum";
import { UserContext } from "../../auth/authenticated-user";

@ObjectType('RiderAddress')
@Authorize({
    authorize: (context: UserContext) => ({riderId: {eq: context.req.user.id}})
})
export class RiderAddressDTO {
    @IDField(() => ID)
    id: number;
    type: RiderAddressType;
    title: string;
    details: string;
    location: Point;
    @FilterableField(() => ID, { filterOnly: true })
    riderId: number;
}