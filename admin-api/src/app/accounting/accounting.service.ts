import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { ProviderTransactionEntity } from "@ridy/database/provider-transaction.entity";
import { Repository } from "typeorm";
import { ChartTimeframe } from "./dto/chart-timeframe.enum";
import { IncomeResultItem } from "./dto/income-result-item.dto";
import { RequestResultItem } from "./dto/request-result-item.dto";

@Injectable()
export class AccountingService {
    constructor(
        @InjectRepository(ProviderTransactionEntity)
        private providerTransactionRepository: Repository<ProviderTransactionEntity>
    ) {}

    incomeChart(timeframe: ChartTimeframe): Promise<IncomeResultItem[]> {
        const vars = this.getQueryVars(timeframe, 'transactionTime');
        return this.providerTransactionRepository.query(`SELECT currency, SUM(amount) as sum, UNIX_TIMESTAMP(ANY_VALUE(transactionTime)) * 1000 AS time from admin_transaction WHERE ${vars.query} GROUP BY currency, ${vars.groupBy}`);
    }

    requestsChart(timeframe: ChartTimeframe): Promise<RequestResultItem[]> {
        const vars = this.getQueryVars(timeframe, 'requestTimestamp');
        return this.providerTransactionRepository.query(`SELECT COUNT(status) as count, status, UNIX_TIMESTAMP(ANY_VALUE(requestTimestamp)) * 1000 AS time from \`request\` WHERE ${vars.query} GROUP BY ${vars.groupBy}, status`)
    }


    private getQueryVars(query: ChartTimeframe, timeField: string): { groupBy: string, query: string} {
        switch (query) {
            case (ChartTimeframe.Daily):
                return { groupBy: `DATE(${timeField}),TIME(${timeField})`, query: `${timeField} = CURDATE()` };
            case (ChartTimeframe.Monthly):
                return { groupBy: `DAYOFYEAR(${timeField}),YEAR(${timeField})`, query: `${timeField} > CURDATE() - INTERVAL 2 MONTH` };
            case (ChartTimeframe.Weekly):
                return { groupBy: `WEEKOFYEAR(${timeField}),YEAR(${timeField})`, query: `${timeField} > CURDATE() - INTERVAL 6 MONTH` };
            case (ChartTimeframe.Yearly):
                return { groupBy: `MONTH(${timeField}),YEAR(${timeField})`, query: `${timeField} > CURDATE() - INTERVAL 12 MONTH` };
        }
    }
}