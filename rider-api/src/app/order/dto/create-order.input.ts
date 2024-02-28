import { Field, ID, InputType, Int } from "@nestjs/graphql";
import { Point } from "@ridy/database";

@InputType()
export class CreateOrderInput {
    @Field(() => Int)
    serviceId!: number;
    points!: Point[];
    addresses!: string[];
    @Field(() => Int)
    intervalMinutes!: number;
    twoWay?: boolean;
    optionIds?: string[];
    couponCode?: string;
}