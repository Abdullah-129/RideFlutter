import { NestjsQueryGraphQLModule } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { DriverEntity } from '@ridy/database/driver.entity';
import { MediaEntity } from '@ridy/database/media.entity';
import { MediaDTO } from './media.dto';
import { UploadService } from './upload.service';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([MediaEntity, DriverEntity])],
      resolvers: [
        {
          EntityClass: MediaEntity,
          DTOClass: MediaDTO,
          create: { disabled: true },
          read: { disabled: true },
          delete: { disabled: true },
          update: { disabled: true }
        }
      ]
    })
  ],
  providers: [UploadService],
  exports: [UploadService, NestjsQueryGraphQLModule]
})
export class UploadModule {}
