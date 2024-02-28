import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { OperatorPermission } from '@ridy/database/enums/operator-permission.enum';
import { OperatorEntity } from '@ridy/database/operator.entity';
import { ForbiddenError } from 'apollo-server-core';
import { Repository } from 'typeorm';

@Injectable()
export class OperatorService {
    constructor(
        @InjectRepository(OperatorEntity)
        public repo: Repository<OperatorEntity>
    ) { }

    async validateCredentials(userName: string, password: string): Promise<OperatorEntity | null> {
        return this.repo.findOne({ userName, password });
    }

    async getById(id: number): Promise<OperatorEntity | null> {
        return this.repo.findOne(id);
    }

    async hasPermission(id: number, permission: OperatorPermission): Promise<OperatorEntity> {
        const operator = await this.repo.findOneOrFail(id, { relations: ['role']});
        const hasPermission = operator.role.permissions.includes(permission);
        if(!hasPermission) throw new ForbiddenError('PERMISSION_NOT_GRANTED');
        return operator;
    }
}
