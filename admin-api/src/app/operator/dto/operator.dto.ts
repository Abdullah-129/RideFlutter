import { Authorize, IDField, Relation } from "@nestjs-query/query-graphql";
import { Field, ID, ObjectType } from "@nestjs/graphql";
import { OperatorRoleDTO } from "./operator-role.dto";
import { OperatorAuthorizer } from "./operator.authorizer";

@ObjectType('Operator')
@Relation('role', () => OperatorRoleDTO, { nullable: true })
@Authorize(OperatorAuthorizer)
export class OperatorDTO {
    @IDField(() => ID)
    id!: number;
    firstName?: string;
    lastName?: string;
    userName!: string;
    mobileNumber?: string;
    email?: string;
    @Field(() => ID)
    roleId?: number;
}