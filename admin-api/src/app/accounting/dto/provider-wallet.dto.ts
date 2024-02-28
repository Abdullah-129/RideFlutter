import { FilterableField, IDField } from "@nestjs-query/query-graphql";
import { Float, ID, ObjectType } from "@nestjs/graphql";

@ObjectType('ProviderWallet')
export class ProviderWalletDTO {
    @IDField(() => ID)
    id: number;
    @FilterableField(() => Float)
    balance: number;
    @FilterableField(() => String)
    currency: string;
}