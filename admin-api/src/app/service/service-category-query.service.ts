import { DeleteOneOptions, QueryService } from '@nestjs-query/core';
import { TypeOrmQueryService } from '@nestjs-query/query-typeorm';
import { Inject } from '@nestjs/common';
import { CONTEXT } from '@nestjs/graphql';
import { InjectRepository } from '@nestjs/typeorm';
import { OperatorPermission } from '@ridy/database/enums/operator-permission.enum';
import { ServiceCategoryEntity } from '@ridy/database/service-category.entity';
import { Repository } from 'typeorm';
import { UserContext } from '../auth/authenticated-admin';
import { OperatorService } from '../operator/operator.service';

import { ServiceCategoryDTO } from './dto/service-category.dto';
import { ServiceDTO } from './dto/service.dto';


@QueryService(ServiceCategoryDTO)
export class ServiceCategoryQueryService extends TypeOrmQueryService<ServiceCategoryDTO> {
    constructor(
        @InjectRepository(ServiceCategoryEntity)
        serviceRepo: Repository<ServiceCategoryEntity>,
        private operatorService: OperatorService,
        @Inject(CONTEXT)
        private userContext: UserContext
    ) {
        super(serviceRepo, { useSoftDelete: true });
    }

    async deleteOne(id: string | number, opts?: DeleteOneOptions<ServiceCategoryDTO>): Promise<ServiceCategoryDTO> {
        await this.operatorService.hasPermission(this.userContext.req.user.id, OperatorPermission.Services_Edit);
        return super.deleteOne(id, opts);
    }
}