import { InputType } from "@nestjs/graphql";

@InputType()
export class LoginInput {
    firebaseToken: string;
}