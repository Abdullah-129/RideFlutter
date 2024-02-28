import { Inject, UseGuards } from "@nestjs/common";
import { Args, CONTEXT, ID, Mutation, Resolver } from "@nestjs/graphql";
import { OperatorPermission } from "@ridy/database/enums/operator-permission.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";
import { TransactionStatus } from "@ridy/database/enums/transaction-status.enum";
import { OperatorEntity } from "@ridy/database/operator.entity";
import { SharedRiderService } from "@ridy/order/shared-rider.service";
import { ForbiddenError } from "apollo-server-core";
import { getRepository } from "typeorm";
import { UserContext } from "../auth/authenticated-admin";
import { JwtAuthGuard } from "../auth/jwt-auth.guard";
import { RiderTransactionInput } from "./dto/rider-transaction.input";
import { RiderWalletDTO } from "./dto/rider-wallet.dto";
import { RiderDTO } from "./dto/rider.dto";

@Resolver()
@UseGuards(JwtAuthGuard)
export class RiderResolver {
    constructor(
        private sharedRiderService: SharedRiderService,
        @Inject(CONTEXT)
        private context: UserContext
    ) {}

    @Mutation(() => RiderWalletDTO)
    async createRiderTransaction(@Args('input', { type: () => RiderTransactionInput }) input: RiderTransactionInput) {
        input.amount = input.action == TransactionAction.Recharge ? Math.abs(input.amount) : Math.abs(input.amount) * -1;
        return this.sharedRiderService.rechargeWallet({...input, operatorId: this.context.req.user.id, status: TransactionStatus.Done});
    }

    @Mutation(() => RiderDTO)
    async deleteOneRider(@Args('id', { type: () => ID}) id: number): Promise<RiderDTO> {
        const operator = await getRepository(OperatorEntity).findOne(this.context.req.user.id, { relations: ['role'] });
        if(!operator.role.permissions.includes(OperatorPermission.Riders_Edit)) {
            throw new ForbiddenError('PERMISSION_NOT_GRANTED');
        }
        return this.sharedRiderService.deleteById(id);
    }
}