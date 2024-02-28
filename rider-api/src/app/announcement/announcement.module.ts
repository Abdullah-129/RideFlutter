import { NestjsQueryGraphQLModule } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { AnnouncementEntity } from '@ridy/database/announcement.entity';

import { AnnouncementDTO } from './dto/announcement.dto';

@Module({
    imports: [NestjsQueryGraphQLModule.forFeature({
        imports: [NestjsQueryTypeOrmModule.forFeature([AnnouncementEntity])],
        resolvers: [
            {
                EntityClass: AnnouncementEntity,
                DTOClass: AnnouncementDTO,
                create: { disabled: true },
                delete: { disabled: true },
                update: { disabled: true }
            }
        ]
    })]
})
export class AnnouncementModule {}
