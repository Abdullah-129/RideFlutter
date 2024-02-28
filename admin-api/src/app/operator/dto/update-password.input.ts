import { InputType } from "@nestjs/graphql";

@InputType()
export class UpdatePasswordInput {
    oldPassword: string;
    newPasswod: string;
}