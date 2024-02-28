import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { OperatorRoleEntity } from '@ridy/database/operator-role.entity';
import { OperatorEntity } from '@ridy/database/operator.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { OperatorRoleDTO } from './dto/operator-role.dto';
import { OperatorDTO } from './dto/operator.dto';
import { CreateOperatorInput } from './dto/create-operator.input';
import { OperatorService } from './operator.service';
import { OperatorResolver } from './operator.resolver';

@Module({
    imports: [NestjsQueryGraphQLModule.forFeature({
        imports: [NestjsQueryTypeOrmModule.forFeature([OperatorEntity, OperatorRoleEntity])],
        resolvers: [
            {
                EntityClass: OperatorRoleEntity,
                DTOClass: OperatorRoleDTO,
                create: { many: { disabled: true }},
                update: { many: { disabled: true }},
                delete: { disabled: true },
                pagingStrategy: PagingStrategies.NONE,
                guards: [JwtAuthGuard]
            },
            {
                EntityClass: OperatorEntity,
                DTOClass: OperatorDTO,
                CreateDTOClass: CreateOperatorInput,
                create: { many: { disabled: true }},
                update: { many: { disabled: true}},
                delete: { disabled: true },
                pagingStrategy: PagingStrategies.OFFSET,
                enableTotalCount: true,
                guards: [JwtAuthGuard]
            }
        ]
    })],
    providers: [OperatorService, OperatorResolver],
    exports: [OperatorService],

})
export class OperatorModule {}
