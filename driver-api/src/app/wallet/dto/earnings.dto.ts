import { ObjectType, registerEnumType } from "@nestjs/graphql";

export enum TimeQuery {
    Daily = 'daily',
    Weekly = 'weekly',
    Monthly = 'monthly'
}

registerEnumType(TimeQuery, { name: 'TimeQuery' });

@ObjectType()
export class StatisticsResult {
    currency: string;
    dataset: Datapoint[];
}

@ObjectType()
export class Datapoint {
    name: string;
    current: string;
    earning: number;
    count: number;
    distance: number;
    time: number;
}