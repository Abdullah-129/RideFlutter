import { registerEnumType } from "@nestjs/graphql";

export enum ChartTimeframe {
    Daily = 'Daily',
    Weekly = 'Weekly',
    Monthly = 'Monthly',
    Yearly = 'Yearly'
}

registerEnumType(ChartTimeframe, { name: 'ChartTimeframe'});