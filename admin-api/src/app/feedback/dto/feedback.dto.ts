import { FilterableField, IDField, UnPagedRelation } from "@nestjs-query/query-graphql";
import { Field, ID, Int, ObjectType } from "@nestjs/graphql";
import { FeedbackParameterDTO } from "./feedback-parameter.dto";

@ObjectType('Feedback')
@UnPagedRelation('parameters', () => FeedbackParameterDTO, { enableAggregate: true })
export class FeedbackDTO {
    @IDField(() => ID)
    id!: number;
    @Field(() => Int)
    score!: number;
    reviewTimestamp: Date;
    description?: string;
    @FilterableField(() => ID)
    driverId: number;
    @FilterableField(() => ID)
    requestId: number;
}