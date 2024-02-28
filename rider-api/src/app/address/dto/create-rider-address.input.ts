import { BeforeCreateOne, CreateOneInputType } from "@nestjs-query/query-graphql";
import { Logger } from "@nestjs/common";
import { InputType } from "@nestjs/graphql";
import { Point } from "@ridy/database";
import { RiderAddressType } from "@ridy/database/enums/rider-address-type.enum";
import { UserContext } from "../../auth/authenticated-user";

@InputType()
@BeforeCreateOne((input: CreateOneInputType<CreateRiderAddressInput>, context: UserContext) => {
    return {input: {...input.input, riderId: context.req.user.id}};
})
export class CreateRiderAddressInput {
    title: string;
    details: string;
    location: Point;
    type?: RiderAddressType;
}