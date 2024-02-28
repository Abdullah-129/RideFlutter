import { DeepPartial, QueryService } from "@nestjs-query/core";
import { TypeOrmQueryService } from "@nestjs-query/query-typeorm";
import { Inject } from "@nestjs/common";
import { CONTEXT } from "@nestjs/graphql";
import { InjectRepository } from "@nestjs/typeorm";
import { SOSActivityAction } from "@ridy/database/enums/sos-activity-action.enum";
import { SOSStatus } from "@ridy/database/enums/sos-status.enum";
import { SOSActivityEntity } from "@ridy/database/sos-activity.entity";
import { SOSEntity } from "@ridy/database/sos.entity";
import { Repository } from "typeorm";
import { UserContext } from "../auth/authenticated-admin";
import { CreateSOSAcitivtyInput } from "./dto/create-sos-activity.input";
import { SOSActivityDTO } from "./dto/sos-activity.dto";

@QueryService(SOSActivityDTO)
export class SOSActivityQueryService extends TypeOrmQueryService<SOSActivityDTO> {
    constructor(
        @InjectRepository(SOSActivityEntity)
        sosActivityRepo: Repository<SOSActivityEntity>,
        @InjectRepository(SOSEntity)
        private sosRepository: Repository<SOSEntity>,
        @Inject(CONTEXT)
        private userContext: UserContext
    ) {
        super(sosActivityRepo);
    }

    override async createOne(record: CreateSOSAcitivtyInput): Promise<SOSActivityDTO> {
        const activity = await super.createOne({...record, operatorId: this.userContext.req.user.id});
        switch(activity.action) {
            case SOSActivityAction.MarkedAsResolved:
                await this.sosRepository.update(record.sosId, { status: SOSStatus.Resolved});
                break;

            case SOSActivityAction.MarkedAsFalseAlarm:
                await this.sosRepository.update(record.sosId, { status: SOSStatus.FalseAlarm });
                break;
        }
        return activity;
    }

}