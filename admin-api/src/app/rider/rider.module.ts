import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { RiderAddressEntity } from '@ridy/database/rider-address.entity';
import { RiderEntity } from '@ridy/database/rider-entity';
import { RiderTransactionEntity } from '@ridy/database/rider-transaction.entity';
import { RiderWalletEntity } from '@ridy/database/rider-wallet.entity';
import { SharedRiderService } from '@ridy/order/shared-rider.service';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { RiderAddressDTO } from './dto/rider-address.dto';

import { RiderTransactionDTO } from './dto/rider-transaction.dto';
import { RiderWalletDTO } from './dto/rider-wallet.dto';
import { RiderDTO } from './dto/rider.dto';
import { RiderResolver } from './rider.resolver';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([RiderEntity, RiderWalletEntity, RiderTransactionEntity, RiderAddressEntity])],
            resolvers: [
                {
                    EntityClass: RiderEntity,
                    DTOClass: RiderDTO,
                    create: { many: { disabled: true }},
                    update: { many: { disabled: true }},
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                },
                {
                    EntityClass: RiderWalletEntity,
                    DTOClass: RiderWalletDTO,
                    create: { disabled: true },
                    update: { disabled: true },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                },
                {
                    EntityClass: RiderTransactionEntity,
                    DTOClass: RiderTransactionDTO,
                    create: { many: { disabled: true }},
                    update: { disabled: true },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                },
                {
                    EntityClass: RiderAddressEntity,
                    DTOClass: RiderAddressDTO,
                    create: { many: { disabled: true }},
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                }
            ]
        })
    ],
    providers: [RiderResolver, SharedRiderService]
})
export class RiderModule {}
