import { GqlExecutionContext, ObjectType } from "@nestjs/graphql";

@ObjectType('AuthenticatedRider')
export class AuthenticatedRiderDTO {
    id: number;
}

export type UserContext = GqlExecutionContext & { req: { user: AuthenticatedRiderDTO } };
export type UserContextOptional = GqlExecutionContext & { req: { user?: AuthenticatedRiderDTO } };