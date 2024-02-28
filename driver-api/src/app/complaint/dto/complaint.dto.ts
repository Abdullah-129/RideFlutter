import { IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { ComplaintStatus } from "@ridy/database/enums/complaint-status.enum";

@ObjectType('Complaint')
export class ComplaintDTO {
    @IDField(() => ID)
    id: number;
    subject: string;
    content?: string;
    status: ComplaintStatus;
}