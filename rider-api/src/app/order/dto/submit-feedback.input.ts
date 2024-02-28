import { Field, ID, InputType, Int } from "@nestjs/graphql";

@InputType()
export class SubmitFeedbackInput {
    @Field(() => Int)
    score: number;
    description?: string;
    @Field(() => ID)
    requestId: number;
    @Field(() => [ID])
    parameterIds?: number[];
}