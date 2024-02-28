import { InputType } from "@nestjs/graphql";
import { OrderStatus } from "@ridy/database/enums/order-status.enum";

@InputType()
export class UpdateOrderInput {
    status: OrderStatus;
    paidAmount?: number;
}