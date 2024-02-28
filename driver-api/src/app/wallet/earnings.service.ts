import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { RequestEntity } from "@ridy/database/request.entity";
import { Repository } from "typeorm";
import { Datapoint, StatisticsResult, TimeQuery } from "./dto/earnings.dto";

@Injectable()
export class EarningsService {
    constructor(
        @InjectRepository(RequestEntity)
        private requestRepository: Repository<RequestEntity>
    ) {}

    async getStats(driverId: number, timeFrame: TimeQuery): Promise<StatisticsResult> {
        const q: Array<any> = await this.requestRepository.query('SELECT currency, COUNT(currency) as count from request where driverId = ? group by currency order by count desc LIMIT 1',[driverId]);
        if(q.length < 1) {
            return {
                currency: 'USD',
                dataset: []
            };
        }
        const mostUsedCurrency: string = q[0].currency;
        let dataset: Datapoint[];
        const fields = 'SUM(costBest - providerShare) AS earning, COUNT(id) AS count, SUM(distanceBest) AS distance, SUM(durationBest) AS time'
        switch (timeFrame) {
            case TimeQuery.Daily:
                dataset = await this.requestRepository.query(`SELECT ANY_VALUE(DATE_FORMAT(requestTimestamp, '%W')) as name, CONCAT(ANY_VALUE(MONTH(CURRENT_TIMESTAMP)),'/',ANY_VALUE(DAY(CURRENT_TIMESTAMP))) AS current, ${fields} from request WHERE DATEDIFF(NOW(),requestTimestamp) < 7 AND driverId = ? AND currency = ? GROUP BY DATE(requestTimestamp)`, [driverId, mostUsedCurrency]);
                break;
            case TimeQuery.Weekly:
                dataset = await this.requestRepository.query(`SELECT CONCAT(ANY_VALUE(YEAR(requestTimestamp)),',W',ANY_VALUE(WEEK(requestTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),',W',ANY_VALUE(WEEK(CURRENT_TIMESTAMP))) AS current, ${fields} FROM request WHERE driverId = ? AND currency = ? GROUP BY YEAR(requestTimestamp), WEEK(requestTimestamp)`, [driverId, mostUsedCurrency]);
                break;

            case TimeQuery.Monthly:
                dataset = await this.requestRepository.query(`SELECT CONCAT(ANY_VALUE(YEAR(requestTimestamp)),'/',ANY_VALUE(MONTH(requestTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),'/',ANY_VALUE(MONTH(CURRENT_TIMESTAMP))) AS current, ${fields} FROM request WHERE DATE(requestTimestamp) > DATE(MAKEDATE(year(now()),1)) AND driverId = ? AND currency = ? GROUP BY YEAR(requestTimestamp), MONTH(requestTimestamp)`, [driverId, mostUsedCurrency]);
                break;
        }
        return {
            currency: mostUsedCurrency,
            dataset: dataset
        };
    }

    async getStatsNew(driverId: number, timeFrame: TimeQuery, startDate: Date, endDate: Date): Promise<StatisticsResult> {
        const q: Array<any> = await this.requestRepository.query('SELECT currency, COUNT(currency) as count from request where driverId = ? group by currency order by count desc LIMIT 1',[driverId]);
        if(q.length < 1) {
            return {
                currency: 'USD',
                dataset: []
            };
        }
        const mostUsedCurrency: string = q[0].currency;
        let dataset: Datapoint[];
        const fields = 'SUM(costBest - providerShare) AS earning, COUNT(id) AS count, SUM(distanceBest) AS distance, SUM(durationBest) AS time';
        switch (timeFrame) {
            case TimeQuery.Daily:
                dataset = await this.requestRepository.query(`SELECT ANY_VALUE(DATE_FORMAT(requestTimestamp, '%W')) as name, CONCAT(ANY_VALUE(MONTH(CURRENT_TIMESTAMP)),'/',ANY_VALUE(DAY(CURRENT_TIMESTAMP))) AS current, ${fields} from request WHERE requestTimestamp > ? AND requestTimestamp < ? AND driverId = ? AND currency = ? GROUP BY DATE(requestTimestamp)`, [startDate, endDate, driverId, mostUsedCurrency]);
                break;
            case TimeQuery.Weekly:
                dataset = await this.requestRepository.query(`SELECT CONCAT(ANY_VALUE(YEAR(requestTimestamp)),',W',ANY_VALUE(WEEK(requestTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),',W',ANY_VALUE(WEEK(CURRENT_TIMESTAMP))) AS current, ${fields} FROM request WHERE requestTimestamp > ? AND requestTimestamp < ? AND driverId = ? AND currency = ? GROUP BY YEAR(requestTimestamp), WEEK(requestTimestamp)`, [startDate, endDate, driverId, mostUsedCurrency]);
                break;

            case TimeQuery.Monthly:
                dataset = await this.requestRepository.query(`SELECT CONCAT(ANY_VALUE(YEAR(requestTimestamp)),'/',ANY_VALUE(MONTH(requestTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),'/',ANY_VALUE(MONTH(CURRENT_TIMESTAMP))) AS current, ${fields} FROM request WHERE requestTimestamp > ? AND requestTimestamp < ? AND driverId = ? AND currency = ? GROUP BY YEAR(requestTimestamp), MONTH(requestTimestamp)`, [startDate, endDate, driverId, mostUsedCurrency]);
                break;
        }
        return {
            currency: mostUsedCurrency,
            dataset: dataset
        };
    }

}