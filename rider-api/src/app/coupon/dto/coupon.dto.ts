import { IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";

@ObjectType('Coupon')
export class CouponDTO {
    @IDField(() => ID)
    id: number;
    code: string;
    title: string;
    description: string;
    expireAt: Date;
}