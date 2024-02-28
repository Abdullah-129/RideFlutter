import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { CarColorEntity } from '@ridy/database/car-color.entity';
import { CarModelEntity } from '@ridy/database/car-model.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';

import { CarColorDTO } from './dto/car-color.dto';
import { CarModelDTO } from './dto/car-model.dto';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([CarColorEntity, CarModelEntity])],
            resolvers: [
                {
                    EntityClass: CarModelEntity,
                    DTOClass: CarModelDTO,
                    create: { many: { disabled: true }},
                    update: { many: { disabled: true }},
                    delete: { many: { disabled: true }},
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                },
                {
                    EntityClass: CarColorEntity,
                    DTOClass: CarColorDTO,
                    create: { many: { disabled: true }},
                    update: { many: { disabled: true }},
                    delete: { many: { disabled: true }},
                    pagingStrategy: PagingStrategies.NONE,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                }
            ]
        })
    ]
})
export class CarModule {}
