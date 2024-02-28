import { InputType } from "@nestjs/graphql";
import { Point } from "@ridy/database";

@InputType()
export class CalculateFareInput {
    points!: Point[];
}