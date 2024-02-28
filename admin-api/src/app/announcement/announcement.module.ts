import { Module } from '@nestjs/common';
import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { AnnouncementEntity } from "@ridy/database/announcement.entity";
import { AnnouncementDTO } from './dto/announcement.dto';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([AnnouncementEntity])],
            resolvers: [
                {
                    EntityClass: AnnouncementEntity,
                    DTOClass: AnnouncementDTO,
                    create: { many: { disabled: true } },
                    update: { many: { disabled: true } },
                    delete: { many: { disabled: true } },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                }
            ]
        })
    ]
})
export class AnnouncementModule {}
