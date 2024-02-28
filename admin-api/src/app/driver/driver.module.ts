import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { DriverTransactionEntity } from '@ridy/database/driver-transaction.entity';
import { DriverWalletEntity } from '@ridy/database/driver-wallet.entity';
import { DriverEntity } from '@ridy/database/driver.entity';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { RedisHelpersModule } from "@ridy/redis/redis-helper.module";
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { DriverResolver } from './driver.resolver';
import { DriverService } from './driver.service';
import { DriverTransactionDTO } from './dto/driver-transaction.dto';
import { DriverWalletDTO } from './dto/driver-wallet.dto';
import { DriverDTO } from './dto/driver.dto';
import { UpdateDriverInput } from './dto/driver.input';

@Module({
    imports: [
        RedisHelpersModule,
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([DriverEntity, DriverTransactionEntity, DriverWalletEntity])],
            resolvers: [
                {
                    EntityClass: DriverEntity,
                    DTOClass: DriverDTO,
                    UpdateDTOClass: UpdateDriverInput,
                    create: { many: { disabled: true } },
                    update: { many: { disabled: true } },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    enableAggregate: true,
                    guards: [JwtAuthGuard]
                },
                {
                    EntityClass: DriverWalletEntity,
                    DTOClass: DriverWalletDTO,
                    create: { disabled: true },
                    update: { disabled: true },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                },
                {
                    EntityClass: DriverTransactionEntity,
                    DTOClass: DriverTransactionDTO,
                    create: { many: { disabled: true }},
                    update: { disabled: true },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                }
            ]
        })
    ],
    providers: [DriverResolver, DriverService, SharedDriverService]
})
export class DriverModule {}
