import { Authorize, BeforeQueryMany, FilterableField, IDField, Relation } from '@nestjs-query/query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { PaymentGatewayType } from '@ridy/database/enums/payment-gateway-type.enum';
import { UserContext } from '../../auth/authenticated-user';
import { MediaDTO } from '../../upload/media.dto';

@ObjectType('PaymentGateway')
@Authorize({
    authorize: (context: UserContext) => ({enabled: { is: true }} as unknown as any)
})
@Relation('media', () => MediaDTO, { nullable: true, disableRemove: true, disableUpdate: true })
export class PaymentGatewayDTO {
    @IDField(() => ID)
    id: number;
    @FilterableField()
    enabled: boolean;
    title: string;
    type: PaymentGatewayType;
    publicKey?: string;
}