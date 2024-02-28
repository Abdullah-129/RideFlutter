import { FilterableField, IDField, Relation } from "@nestjs-query/query-graphql";
import { Float, ID, ObjectType } from "@nestjs/graphql";
import { FleetDTO } from "./fleet.dto";

@ObjectType('FleetWallet')
@Relation('fleet', () => FleetDTO)
export class FleetWalletDTO {
    @IDField(() => ID)
    id: number;
    @FilterableField(() => Float)
    balance: number;
    @FilterableField(() => String)
    currency: string;
    @FilterableField(() => ID)
    fleetId: number;
}