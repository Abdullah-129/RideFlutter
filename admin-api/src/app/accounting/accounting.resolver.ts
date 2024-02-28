import { UseGuards } from '@nestjs/common';
import { Args, Query, Resolver } from '@nestjs/graphql';
import { DriverWalletEntity } from '@ridy/database/driver-wallet.entity';
import { RiderWalletEntity } from '@ridy/database/rider-wallet.entity';
import { writeFile } from 'fs/promises';
import { json2csvAsync } from 'json-2-csv';
import { join } from 'path';
import { Between, FindManyOptions, getRepository, In, Like } from 'typeorm';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';

import { AccountingService } from './accounting.service';
import { ChartTimeframe } from './dto/chart-timeframe.enum';
import { ExportArgsDTO, ExportResultDTO } from './dto/export.dto';
import { IncomeResults } from './dto/income-result-item.dto';
import { RequestsResults } from './dto/request-result-item.dto';

@Resolver()
export class AccountingResolver {
    constructor(
        private service: AccountingService
    ) { }

    @Query(() => IncomeResults)
    async incomeChart(@Args('timeframe', { type: () => ChartTimeframe }) input: ChartTimeframe): Promise<IncomeResults> {
        const items = await this.service.incomeChart(input);
        return { items };
    }

    @Query(() => RequestsResults)
    async requestChart(@Args('timeframe', { type: () => ChartTimeframe }) input: ChartTimeframe): Promise<RequestsResults> {
        const items = await this.service.requestsChart(input);
        return { items };
    }

    @Query(() => ExportResultDTO)
    @UseGuards(JwtAuthGuard)
    async export(@Args('input', { type: () => ExportArgsDTO }) input: ExportArgsDTO) {
        const options: FindManyOptions = {};
        if (input.filters) {
            for (const f of input.filters) {
                if (typeof f.value != 'string')
                    continue;
                if (f.value.includes('^')) {
                    const a = f.value.split('^');
                    f.value = Between(a[0], a[1]) as any;
                } else if (f.value.startsWith('%') && f.value.endsWith('%')) {
                    f.value = Like(f.value) as any;
                } else if (f.value.includes('|')) {
                    const s = f.value.split('|');
                    f.value = In(s) as any;
                }
                
            }
            options.where = input.filters.map(filter => {
                let obj = {};
                obj[filter.field] = filter.value;
            });
        }
        if (input.sort) {
            const _sort = {};
            _sort[input.sort.property] = input.sort.direction;
            options.order = _sort;
        }
        if (input.relations != null) {
            options.relations = input.relations;
        }
        const result = (await getRepository(`${input.table}Entity`).find(options)) as any[];
        if (input.table == 'DriverWallet' && process.env.DEMO_MODE != null) {
            (result as DriverWalletEntity[]).forEach(x => {
                const length = x.driver.mobileNumber.length;
                x.driver.mobileNumber = `${x.driver.mobileNumber.toString().substring(0, length - 3)}xxxx`;
                x.driver.email = 'Confidential';
            });
        }
        if (input.table == 'RiderWallet' && process.env.DEMO_MODE != null) {
            (result as RiderWalletEntity[]).forEach(x => {
                const length = x.rider.mobileNumber.length;
                x.rider.mobileNumber = `${x.rider.mobileNumber.toString().substring(0, length - 3)}xxxx`;
                x.rider.email = 'Confidential';
            });
        }
        if (input.type == 'csv') {
            const str = await json2csvAsync(result);
            const fileName = `${new Date().getTime().toString()}.csv`;
            await writeFile(join(process.cwd(), 'uploads', `${new Date().getTime().toString()}.csv`), str);
            return {
                url: `uploads/${fileName}`
            }
        }
    }
}