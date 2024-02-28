import { Field, ID, InputType } from "@nestjs/graphql";
import { SOSActivityAction } from "@ridy/database/enums/sos-activity-action.enum";

@InputType()
export class CreateSOSAcitivtyInput {
    action: SOSActivityAction;
    note?: string;
    @Field(() => ID)
    sosId: number;
}