import { Inject, UseGuards } from "@nestjs/common";
import { Args, CONTEXT, Mutation, Resolver, Query, GraphQLISODateTime } from "@nestjs/graphql";
import { InjectRepository } from "@nestjs/typeorm";
import { PaymentGatewayEntity } from "@ridy/database/payment-gateway.entity";
import { Repository } from "typeorm";
import { UserContext } from "../auth/authenticated-user";
import { GqlAuthGuard } from "../auth/jwt-gql-auth.guard";
import { StatisticsResult, TimeQuery } from "./dto/earnings.dto";
import { TopUpWalletInput, TopUpWalletResponse, TopUpWalletStatus } from "./dto/top-up-wallet.input";
import { EarningsService } from "./earnings.service";

@UseGuards(GqlAuthGuard)
@Resolver()
export class WalletResolver {
  constructor(
    @InjectRepository(PaymentGatewayEntity)
    private gatewayRepo: Repository<PaymentGatewayEntity>,
    @Inject(CONTEXT) private context: UserContext,
    private earningsService: EarningsService
  ) { }

  @Mutation(() => TopUpWalletResponse)
  async topUpWallet(@Args('input', { type: () => TopUpWalletInput }) input: TopUpWalletInput): Promise<TopUpWalletResponse> {
    const gateway = await this.gatewayRepo.findOne(input.gatewayId);
    const params = `userType=driver&userId=${this.context.req.user.id}&paymentGatewayId=${gateway.id}&amount=${input.amount}&currency=${input.currency}&returnUrl=${process.env.DRIVER_SERVER_URL}/payment_result`
    return {
      status: TopUpWalletStatus.Redirect,
      url: `${process.env.GATEWAY_SERVER_URL}/pay?${params}`
    };
  }

  @Query(() => StatisticsResult)
  async getStats(@Args('timeframe', { type: () => TimeQuery }) timeFrame: TimeQuery) {
    return this.earningsService.getStats(this.context.req.user.id, timeFrame);
  }

  @Query(() => StatisticsResult)
  async getStatsNew(
    @Args('timeframe', { type: () => TimeQuery }) timeFrame: TimeQuery,
    @Args('startDate', { type: () => GraphQLISODateTime }) startDate: Date,
    @Args('endDate', { type: () => GraphQLISODateTime }) endDate: Date) {
    return this.earningsService.getStatsNew(this.context.req.user.id, timeFrame, startDate, endDate);
  }
}