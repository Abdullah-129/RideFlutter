import { NestjsQueryGraphQLModule } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { MediaEntity } from '@ridy/database/media.entity';
import { MediaDTO } from './media.dto';
import { UploadService } from './upload.service';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([MediaEntity])],
      resolvers: [
        {
          DTOClass: MediaDTO,
          EntityClass: MediaEntity,
          create: { disabled: true },
          read: { disabled: true },
          delete: { disabled: true },
          update: { disabled: true }
        }
      ]
    })
  ],
  providers: [UploadService],
  exports: [UploadService]
})
export class UploadModule { }
