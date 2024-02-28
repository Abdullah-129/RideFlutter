import { BeforeUpdateOne, UpdateOneInputType } from "@nestjs-query/query-graphql";
import { InputType } from "@nestjs/graphql";
import { Gender } from "@ridy/database/enums/gender.enum";
import { RiderDocumentType } from "@ridy/database/enums/rider-document-type";
import { UserContext } from "../../auth/authenticated-user";

@InputType()
@BeforeUpdateOne((input: UpdateOneInputType<UpdateRiderInput>, context: UserContext) => {
    input.id = context.req.user.id;
    return input;
})
export class UpdateRiderInput {
    firstName?: string;
    lastName?: string;
    gender?: Gender;
    email?: string;
    notificationPlayerId?:string;
    isResident?: boolean;
    idNumber?: string;
    documentType?: RiderDocumentType;
}