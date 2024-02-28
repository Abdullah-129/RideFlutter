import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { ServiceCategoryEntity } from '@ridy/database/service-category.entity';
import { ServiceEntity } from '@ridy/database/service.entity';
import { SOSActivityEntity } from '@ridy/database/sos-activity.entity';
import { SOSEntity } from '@ridy/database/sos.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { CreateSOSAcitivtyInput } from './dto/create-sos-activity.input';
import { SOSActivityDTO } from './dto/sos-activity.dto';
import { SOSDTO } from './dto/sos.dto';
import { SOSActivityQueryService } from './sos-acitivty-query.service';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([SOSEntity, SOSActivityEntity])],
            services: [SOSActivityQueryService],
            resolvers: [
                {
                    EntityClass: SOSEntity,
                    DTOClass: SOSDTO,
                    create: { disabled: true },
                    update: { disabled: true },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                },
                {
                    EntityClass: SOSActivityEntity,
                    DTOClass: SOSActivityDTO,
                    CreateDTOClass: CreateSOSAcitivtyInput,
                    ServiceClass: SOSActivityQueryService,
                    read: { disabled: true },
                    create: { many: { disabled: true } },
                    update: { disabled: true },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.NONE,
                    guards: [JwtAuthGuard]
                }
            ]
        })
    ]
})
export class SOSModule {}
