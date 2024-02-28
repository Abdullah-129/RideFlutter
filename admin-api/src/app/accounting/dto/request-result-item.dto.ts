import { ObjectType } from "@nestjs/graphql";
import { OrderStatus } from "@ridy/database/enums/order-status.enum";

@ObjectType()
export class RequestResultItem {
    time: string;
    count: number;
    status: OrderStatus;
}

@ObjectType()
export class RequestsResults {
    items: RequestResultItem[];
}