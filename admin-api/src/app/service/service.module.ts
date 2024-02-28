import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { ServiceCategoryEntity } from '@ridy/database/service-category.entity';
import { ServiceOptionEntity } from '@ridy/database/service-option.entity';
import { ServiceEntity } from '@ridy/database/service.entity';
import { ZonePriceEntity } from '@ridy/database/zone-price.entity';

import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { OperatorModule } from '../operator/operator.module';
import { ServiceCategoryDTO } from './dto/service-category.dto';
import { ServiceOptionDTO } from './dto/service-option.dto';
import { ServiceDTO } from './dto/service.dto';
import { ZonePriceDTO } from './dto/zone-price.dto';
import { ServiceCategoryQueryService } from './service-category-query.service';
import { ServiceOptionQueryService } from './service-option-query.service';
import { ServiceQueryService } from './service-query.service';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          ServiceCategoryEntity,
          ServiceEntity,
          ServiceOptionEntity,
          ZonePriceEntity,
        ]),
        OperatorModule,
      ],
      services: [
        ServiceQueryService,
        ServiceCategoryQueryService,
        ServiceOptionQueryService,
      ],
      resolvers: [
        {
          EntityClass: ServiceEntity,
          DTOClass: ServiceDTO,
          ServiceClass: ServiceQueryService,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          pagingStrategy: PagingStrategies.NONE,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: ServiceCategoryEntity,
          DTOClass: ServiceCategoryDTO,
          ServiceClass: ServiceCategoryQueryService,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          pagingStrategy: PagingStrategies.NONE,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: ServiceOptionEntity,
          DTOClass: ServiceOptionDTO,
          ServiceClass: ServiceOptionQueryService,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          pagingStrategy: PagingStrategies.NONE,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: ZonePriceEntity,
          DTOClass: ZonePriceDTO,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
      ],
    }),
  ],
})
export class ServiceModule {}
