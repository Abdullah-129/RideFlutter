import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Point } from "@ridy/database";
import { DriverEntity } from "@ridy/database/driver.entity";
import { DriverRedisService } from '@ridy/redis/driver-redis.service';
import { Repository } from "typeorm";
import { OnlineDriver, OnlineDriverWithData } from "./dto/driver-location.dto";

@Injectable()
export class DriverService {
    constructor(
        @InjectRepository(DriverEntity)
        private driverRepository: Repository<DriverEntity>,
        private driverRedisService: DriverRedisService) {}

    getDriversLocation(center: Point, count: number): Promise<OnlineDriver[]> {
        return this.driverRedisService.getAllOnline(center, count);
    }

    async getDriversLocationWithData(center: Point, count: number): Promise<OnlineDriverWithData[]> {
        const drivers = await this.getDriversLocation(center, count);
        const driverData = await this.driverRepository.findByIds(drivers.map(driver => driver.driverId));
        const result: OnlineDriverWithData[] = driverData.map(_driver => {
            const redisDriver = drivers.filter(driver => driver.driverId == _driver.id)[0];
            const length = _driver.mobileNumber.toString().length;
            if(process.env.DEMO_MODE != null && _driver.mobileNumber != null && length > 4) {
                _driver.mobileNumber = `${_driver.mobileNumber.toString().substring(0, length - 3)}xxxx`;
            }
            return {
                ..._driver,
                ...redisDriver
            }
        });
        return result;
    }
}