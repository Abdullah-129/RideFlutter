import { ObjectType } from "@nestjs/graphql";

@ObjectType()
export class TokenObject {
    token: string;
}