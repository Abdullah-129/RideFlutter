import { Field, ID, InputType } from "@nestjs/graphql";
import { DriverStatus } from "@ridy/database/enums/driver-status.enum";
import { Gender } from "@ridy/database/enums/gender.enum";

@InputType()
export class UpdateDriverInput {
    @Field(() => ID)
    fleetId?: number;
    @Field(() => ID)
    carId?: number;
    @Field(() => ID)
    carColorId?: number;
    firstName?: string;
    @Field(() => String)
    lastName?: string;
    certificateNumber?: string;
    email?: string;
    carProductionYear?: number;
    carPlate?: string;
    @Field(() => DriverStatus)
    status?: DriverStatus;
    gender?: Gender;
    accountNumber?: string;
    bankName?: string;
    bankRoutingNumber?: string;
    bankSwift?: string;
    address?: string;
    softRejectionNote?: string;
    @Field(() => ID)
    mediaId?: number;
}