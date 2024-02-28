import { GqlExecutionContext, ObjectType } from "@nestjs/graphql";

@ObjectType('AuthenticatedDriver')
export class AuthenticatedDriverDTO {
    id: number;
}

export type UserContext = GqlExecutionContext & { req: { user: AuthenticatedDriverDTO } };