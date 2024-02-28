import { Authorize, FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { UserContext } from "../../auth/authenticated-user";

@ObjectType('DriverWallet')
@Authorize({
    authorize: (context: UserContext) => ({driverId: {eq: context.req.user.id}})
})
export class DriverWalletDTO {
    @IDField(() => ID)
    id: number;
    balance: number;
    currency: string;
    @FilterableField(() => ID, { filterOnly: true })
    driverId: number;
}