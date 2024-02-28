import { Authorize, FilterableField, IDField } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { AnnouncementUserType } from "@ridy/database/enums/anouncement-user-type.enum";
import { AnnouncementAuthorizer } from "./announcement.authorizer";

@ObjectType('Announcement')
@Authorize(AnnouncementAuthorizer)
export class AnnouncementDTO {
    @IDField(() => ID)
    id!: number;
    title: string;
    description: string;
    url?: string;
    userType: AnnouncementUserType[];
    startAt: Date;
    expireAt: Date;
}