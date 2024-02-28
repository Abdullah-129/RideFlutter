import { NestjsQueryGraphQLModule } from '@nestjs-query/query-graphql';
import { Module } from '@nestjs/common';
import { NestjsQueryTypeOrmModule } from "@nestjs-query/query-typeorm";
import { RiderEntity } from '@ridy/database/rider-entity';
import { RiderDTO } from './dto/rider.dto';
import { UpdateRiderInput } from './dto/update-rider.input';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { RiderWalletEntity } from '@ridy/database/rider-wallet.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SharedRiderService } from "@ridy/order/shared-rider.service";
import { RiderTransactionEntity } from '@ridy/database/rider-transaction.entity';

@Module({
    imports: [
        TypeOrmModule.forFeature([RiderEntity, RiderWalletEntity, RiderTransactionEntity]),
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([RiderEntity])],
            resolvers: [
                {
                    EntityClass: RiderEntity,
                    DTOClass: RiderDTO,
                    UpdateDTOClass: UpdateRiderInput,
                    read: { many: { disabled: true } },
                    create: { disabled: true },
                    update: { many: { disabled: true } },
                    delete: { disabled: true },
                    guards: [GqlAuthGuard]
                }
            ]
        })
    ],
    providers: [
        SharedRiderService
    ],
    exports: [
        SharedRiderService
    ]
})
export class RiderModule { }
