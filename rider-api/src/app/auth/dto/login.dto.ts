import { ObjectType } from "@nestjs/graphql";

@ObjectType('Login')
export class LoginDTO {
    jwtToken: string;
}