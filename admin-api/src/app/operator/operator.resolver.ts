import { Inject, UseGuards } from "@nestjs/common";
import { Args, CONTEXT, Mutation, Resolver } from "@nestjs/graphql";
import { ForbiddenError } from "apollo-server-core";
import { UserContext } from "../auth/authenticated-admin";
import { JwtAuthGuard } from "../auth/jwt-auth.guard";
import { OperatorDTO } from "./dto/operator.dto";
import { UpdatePasswordInput } from "./dto/update-password.input";
import { OperatorService } from "./operator.service";

@Resolver()
@UseGuards(JwtAuthGuard)
export class OperatorResolver {
    constructor(
        private service: OperatorService,
        @Inject(CONTEXT)
        private context: UserContext
    ) {}

    @Mutation(() => OperatorDTO)
    async updatePassword(@Args('input', { type: () => UpdatePasswordInput }) input: UpdatePasswordInput) {
        if(process.env.DEMO_MODE != null) {
            throw new ForbiddenError('Action not allowed in demo mode.');
        }
        const operator = await this.service.getById(this.context.req.user.id);
        if(operator.password != input.oldPassword) {
            throw new ForbiddenError('Old password don\'t match');
        }
        await this.service.repo.update(operator.id, { password: input.newPasswod });
        operator.password = input.newPasswod;
        return operator;
    }
}