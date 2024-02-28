import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { PaymentGatewayEntity } from '@ridy/database/payment-gateway.entity';
import { RiderTransactionEntity } from '@ridy/database/rider-transaction.entity';
import { RiderWalletEntity } from '@ridy/database/rider-wallet.entity';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { PaymentGatewayDTO } from './dto/payment-gateway.dto';
import { RiderTransactionDTO } from './dto/rider-transaction.dto';
import { RiderWalletDTO } from './dto/rider-wallet.dto';
import { WalletResolver } from './wallet-resolver';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([RiderTransactionEntity, RiderWalletEntity, PaymentGatewayEntity])],
            resolvers: [
                {
                    EntityClass: RiderTransactionEntity,
                    DTOClass: RiderTransactionDTO,
                    read: { one: { disabled: true }},
                    create: { disabled: true },
                    update: { disabled: true },
                    delete: { disabled: true },
                    guards: [GqlAuthGuard]
                },
                {
                    EntityClass: RiderWalletEntity,
                    DTOClass: RiderWalletDTO,
                    read: { one: { disabled: true }},
                    create: { disabled: true },
                    update: { disabled: true },
                    delete: { disabled: true },
                    guards: [GqlAuthGuard],
                    pagingStrategy: PagingStrategies.NONE
                },
                {
                    EntityClass: PaymentGatewayEntity,
                    DTOClass: PaymentGatewayDTO,
                    read: { one: { disabled: true }},
                    create: { disabled: true },
                    update: { disabled: true },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.NONE
                }
            ]
        })
    ],
    providers: [WalletResolver]
})
export class WalletModule {}
