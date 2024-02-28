import { Authorize, IDField, UnPagedRelation } from "@nestjs-query/query-graphql";
import { Field, ID, Int, ObjectType } from "@nestjs/graphql";
import { ServiceDTO } from "../../service/dto/service.dto";
import { CouponAuthorizer } from "./coupon.authorizer";

@ObjectType('Coupon')
@UnPagedRelation('allowedServices', () => ServiceDTO)
@Authorize(CouponAuthorizer)
export class CouponDTO {
    @IDField(() => ID)
    id!: number;
    code: string;
    title: string;
    description: string;
    @Field(() => Int)
    manyUsersCanUse!: number;
    @Field(() => Int)
    manyTimesUserCanUse!: number;
    minimumCost!: number;
    maximumCost!: number;
    startAt!: Date;
    expireAt!: Date;
    @Field(() => Int)
    discountPercent!: number;
    @Field(() => Int)
    discountFlat!: number;
    creditGift!: number;
    isEnabled!: boolean;
    isFirstTravelOnly!: boolean;
}