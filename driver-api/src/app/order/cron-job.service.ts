import { Injectable, Logger } from '@nestjs/common';
import { Interval } from '@nestjs/schedule';
import { DriverStatus } from '@ridy/database/enums/driver-status.enum';
import { DriverNotificationService } from '@ridy/order/firebase-notification-service/driver-notification.service';
import { DriverRedisService } from '@ridy/redis/driver-redis.service';
import { OrderRedisService } from '@ridy/redis/order-redis.service';
import { InjectRedis } from '@liaoliaots/nestjs-redis';

import { DriverService } from '../driver/driver.service';
import { OrderService } from './order.service';
import { Redis } from 'ioredis';
import { SharedDriverService } from '@ridy/order/shared-driver.service';
import { Between, IsNull, Not } from 'typeorm';
import { SharedFleetService } from '@ridy/order/shared-fleet.service';

@Injectable()
export class CronJobService {
    constructor(
        private orderService: OrderService,
        private driverService: DriverService,
        @InjectRedis() private readonly redisService: Redis,
        private driverRedisService: DriverRedisService,
        private orderRedisService: OrderRedisService,
        private driverNotificationService: DriverNotificationService,
        private sharedDriverService: SharedDriverService,
        private sharedFleetService: SharedFleetService
    ) {}

    @Interval(300_000)
    async cronTask() {
        const logger = new Logger(CronJobService.name);
        logger.debug('Running expiration validation cron task.');
        const ts = Math.round(new Date().getTime());
        // Driver Locations Expire Time If Not Updated, 60 Minutes By Default
        const tsDriverMaxTime = ts - (60 * 60000);
        // Requests Expire Time, 10 Minutes By Default
        const expirationMinutes = parseInt(process.env.REQUEST_EXPIRATION ?? '10');
        const tsRequestMaxTime = ts - (expirationMinutes * 60000);
        const expiredDrivers: number[] = (await this.redisService.zrangebyscore('driver-location-time', 0, tsDriverMaxTime)).map(str => parseInt(str));
        const expiredRequests: number[] = (await this.redisService.zrangebyscore('request-time', 0, tsRequestMaxTime)).map(str => parseInt(str));

        // Expiring drivers locations with outdated location
        if(expiredDrivers.length > 0 && process.env.DRIVERS_ALWAYS_ON == null) {
            const drivers = (await this.driverService.findByIds(expiredDrivers)).filter(driver => driver.status != DriverStatus.InService).map(driver => driver.id);
            this.driverService.expireDriverStatus(drivers);
        }
        // Expiring requests with expired timestamp (10 minutes ago by default)
        if(expiredRequests.length > 0) {
            this.orderService.expireOrders(expiredRequests);
        }

        // Notifying drivers of an unaccepted orders
        const waitingMinTime = ts - (10 * 60000);
        const waitingMaxTime = ts + (30 * 60000);
        const waitingRequestIds = (await this.orderRedisService.getRequestIdsInTimeRage(waitingMinTime, waitingMaxTime)).map(id => parseInt(id));
        for (const waitingRequest of waitingRequestIds) {
            const driversNotified = await this.orderRedisService.getDriversNotified(waitingRequest);
            const requestLocation = await this.redisService.geopos('request', waitingRequest.toString());
            let closeDrivers = await this.driverRedisService.getClose({lat: parseFloat(requestLocation[0][1]), lng: parseFloat(requestLocation[0][0])},10000);
            closeDrivers = closeDrivers.filter(x => {
                return !(driversNotified.includes(x.driverId));
            });
            if(closeDrivers.length > 0) {
                let driverIds = closeDrivers.map(x=>x.driverId);
                const order = await this.orderService.orderRepository.findOne(waitingRequest);
                const fleetIds = await this.sharedFleetService.getFleetIdsInPoint(order.points[0]);
                const drivers = await this.sharedDriverService.getOnlineDriversWithServiceId(driverIds, order.serviceId, fleetIds);
                this.driverNotificationService.requests(drivers);
            }
        }

        // Notifiying driver on upcoming booking orders
        const expectedTimestampFrom = ts - (15 * 60000);
        const expectedTimestampTo = ts - (10 * 60000);
        const expectedTimestampFromDate = new Date().setTime(expectedTimestampFrom);
        const expectedTimestampToDate = new Date().setTime(expectedTimestampTo);
        const drivers = (await this.orderService.orderRepository.find({where: {expectedTimestamp: Between(expectedTimestampFromDate, expectedTimestampToDate), driverId: Not(IsNull()) }, relations: ['driver']})).map(order => order.driver);
        for(const driver of drivers) {
            //this.driverNotificationService.upcomingBooking(driver);
        }
    }
}