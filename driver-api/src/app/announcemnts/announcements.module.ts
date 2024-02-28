import { NestjsQueryGraphQLModule } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { AnnouncementEntity } from "@ridy/database/announcement.entity";
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { AnnouncementDTO } from './dto/announcement.dto';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([AnnouncementEntity])],
            resolvers: [
              {
                EntityClass: AnnouncementEntity,
                DTOClass: AnnouncementDTO,
                read: { one: { disabled: true } },
                create: { disabled: true },
                update:  { disabled: true },
                delete: { disabled: true },
                guards: [GqlAuthGuard]
              }
            ],
          })
    ]
})
export class AnnouncementsModule {}
