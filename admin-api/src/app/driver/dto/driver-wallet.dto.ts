import { FilterableField, IDField, Relation } from "@nestjs-query/query-graphql";
import { Float, ID, ObjectType } from "@nestjs/graphql";
import { DriverDTO } from "./driver.dto";

@ObjectType('DriverWallet')
@Relation('driver', () => DriverDTO, { nullable: true })
export class DriverWalletDTO {
    @IDField(() => ID)
    id: number;
    @FilterableField(() => Float)
    balance: number;
    @FilterableField(() => String)
    currency: string;
    @FilterableField(() => ID)
    driverId?: number;
}