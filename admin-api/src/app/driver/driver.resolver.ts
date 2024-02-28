import { Inject, UseGuards } from "@nestjs/common";
import { Args, CONTEXT, ID, Int, Mutation, Query, Resolver } from "@nestjs/graphql";
import { Point } from "@ridy/database";
import { OperatorPermission } from "@ridy/database/enums/operator-permission.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";
import { TransactionStatus } from "@ridy/database/enums/transaction-status.enum";
import { OperatorEntity } from "@ridy/database/operator.entity";
import { SharedDriverService } from "@ridy/order/shared-driver.service";
import { ForbiddenError } from "apollo-server-core";
import { getRepository } from "typeorm";
import { UserContext } from "../auth/authenticated-admin";
import { JwtAuthGuard } from "../auth/jwt-auth.guard";
import { DriverService } from "./driver.service";
import { OnlineDriver, OnlineDriverWithData } from "./dto/driver-location.dto";
import { DriverTransactionInput } from "./dto/driver-transaction.input";
import { DriverWalletDTO } from "./dto/driver-wallet.dto";
import { DriverDTO } from "./dto/driver.dto";


@Resolver()
@UseGuards(JwtAuthGuard)
export class DriverResolver {
    constructor(
        private driverService: DriverService,
        private sharedDriverService: SharedDriverService,
        @Inject(CONTEXT)
        private context: UserContext
    ) {}

    @Query(() => [OnlineDriver])
    async getDriversLocation(@Args('center', { type: () => Point }) center: Point, @Args('count', { type: () => Int }) count: number): Promise<OnlineDriver[]> {
        return this.driverService.getDriversLocation(center, count);
    }

    @Query(() => [OnlineDriverWithData])
    async getDriversLocationWithData(@Args('center', { type: () => Point }) center: Point, @Args('count', { type: () => Int }) count: number): Promise<OnlineDriverWithData[]> {
        return this.driverService.getDriversLocationWithData(center, count);
    }

    @Mutation(() => DriverWalletDTO)
    async createDriverTransaction(@Args('input', { type: () => DriverTransactionInput }) input: DriverTransactionInput) {
        input.amount = input.action == TransactionAction.Recharge ? Math.abs(input.amount) : Math.abs(input.amount) * -1;
        return this.sharedDriverService.rechargeWallet({...input, operatorId: this.context.req.user.id, status: TransactionStatus.Done});
    }

    @Mutation(() => DriverDTO)
    async deleteOneDriver(@Args('id', { type: () => ID }) id: number): Promise<DriverDTO> {
        const operator = await getRepository(OperatorEntity).findOne(this.context.req.user.id, { relations: ['role'] });
        if(!operator.role.permissions.includes(OperatorPermission.Drivers_Edit)) {
            throw new ForbiddenError('PERMISSION_NOT_GRANTED');
        }
        return this.sharedDriverService.deleteById(id);
    }
}