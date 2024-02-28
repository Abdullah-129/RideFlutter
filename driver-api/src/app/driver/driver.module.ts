import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DriverEntity } from '@ridy/database/driver.entity';
import { DriverService } from './driver.service';
import { DriverDTO } from './dto/driver.dto';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { CarModelDTO } from './dto/car-model.dto';
import { CarModelEntity } from '@ridy/database/car-model.entity';
import { CarColorDTO } from './dto/car-color.dto';
import { CarColorEntity } from '@ridy/database/car-color.entity';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { RedisHelpersModule } from '@ridy/redis/redis-helper.module';
import { UploadModule } from '../upload/upload.module';
import { MediaEntity } from '@ridy/database/media.entity';
import { DriverQueryService } from './driver-query.service';
import { ServiceEntity } from '@ridy/database/service.entity';
import { UpdateDriverInput } from './dto/update-driver.input';

@Module({
  imports: [
    RedisHelpersModule,
    UploadModule,
    TypeOrmModule.forFeature([DriverEntity]),
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        RedisHelpersModule,
        NestjsQueryTypeOrmModule.forFeature([DriverEntity, CarModelEntity, CarColorEntity, MediaEntity, ServiceEntity])],
      services: [DriverQueryService],
      resolvers: [
        {
          EntityClass: DriverEntity,
          DTOClass: DriverDTO,
          ServiceClass: DriverQueryService,
          UpdateDTOClass: UpdateDriverInput,
          read: { many: { disabled: true } },
          create: { disabled: true },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          guards: [GqlAuthGuard]
        },
        {
          EntityClass: CarModelEntity,
          DTOClass: CarModelDTO,
          create: { disabled: true },
          read: { one: { disabled: true } },
          update: { disabled: true },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.NONE
        },
        {
          EntityClass: CarColorEntity,
          DTOClass: CarColorDTO,
          create: { disabled: true },
          read: { one: { disabled: true } },
          update: { disabled: true },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.NONE
        }
      ],
    }),
  ],
  providers: [DriverService],
  exports: [DriverService]
})
export class DriverModule { }
