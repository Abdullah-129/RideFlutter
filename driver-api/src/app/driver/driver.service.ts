import { Injectable } from '@nestjs/common';
import { DriverEntity } from '@ridy/database/driver.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverStatus } from '@ridy/database/enums/driver-status.enum';
import { DriverRedisService } from '@ridy/redis/driver-redis.service';

@Injectable()
export class DriverService {
    constructor(
        @InjectRepository(DriverEntity) private repo: Repository<DriverEntity>,
        private driverRedisService: DriverRedisService
      ) {}
    
      private async findUserByMobileNumber(mobileNumber: string): Promise<DriverEntity> {
        return this.repo.findOne({ where: { mobileNumber }, withDeleted: true });
      }
    
      async findOrCreateUserWithMobileNumber(
        mobileNumber: string
      ): Promise<DriverEntity> {
        const findResult = await this.findUserByMobileNumber(mobileNumber);
        if(findResult?.deletedAt != null) {
          await this.repo.restore(findResult.id);
        }
        return findResult ?? this.repo.save({
          mobileNumber: mobileNumber,
        });
      }

      async findByIds(ids: number[]): Promise<DriverEntity[]> {
        return this.repo.findByIds(ids, { withDeleted: true });
      }

      async expireDriverStatus(driverIds: number[]) {
        if(driverIds.length < 1) {
          return;
        }
        this.driverRedisService.expire(driverIds);
        return this.repo.update(driverIds, { status: DriverStatus.Offline, lastSeenTimestamp: new Date() });
      }

      
}

