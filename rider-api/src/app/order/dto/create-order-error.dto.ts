import { registerEnumType } from "@nestjs/graphql";

export enum CreateOrderError {
    DistanceTooFar = 'DISTANCE_TOO_FAR',
    UnsufficientCredit = 'UNSUFFICIENT_CREDIT'
}

registerEnumType(CreateOrderError, { name: 'CreateOrderError' });

