import { Authorize, IDField, Relation } from "@nestjs-query/query-graphql";
import { ID, ObjectType } from "@nestjs/graphql";
import { PaymentGatewayType } from "@ridy/database/enums/payment-gateway-type.enum";
import { MediaDTO } from "../../upload/media.dto";
import { GatewayAuthorizer } from "./gateway.authorizer";

@ObjectType('PaymentGateway')
@Authorize(GatewayAuthorizer)
@Relation('media', () => MediaDTO, { nullable: true })
export class PaymentGatewayDTO {
    @IDField(() => ID)
    id!: number;
    enabled!: boolean;
    title!: string;
    type!: PaymentGatewayType;
    publicKey?: string;
    privateKey: string;
    merchantId?: string;
    saltKey?: string;
    mediaId?: number;
}