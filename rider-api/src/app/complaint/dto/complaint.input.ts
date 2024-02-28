import { BeforeCreateOne, CreateOneInputType } from "@nestjs-query/query-graphql";
import { Field, ID, InputType } from "@nestjs/graphql";

@InputType()
@BeforeCreateOne((input: CreateOneInputType<ComplaintInput>) => {
    input.input.requestedByDriver = false;
    return input;
})
export class ComplaintInput {
    @Field(() => ID)
    requestId: number;
    subject: string;
    content?: string;
    requestedByDriver?: boolean;
}