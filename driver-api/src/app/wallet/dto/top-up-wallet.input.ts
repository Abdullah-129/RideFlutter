import { Field, ID, InputType, ObjectType, registerEnumType } from '@nestjs/graphql';

export enum TopUpWalletStatus {
  OK = 'ok',
  Redirect = 'redirect'
}
registerEnumType(TopUpWalletStatus, { name: 'TopUpWalletStatus' });

@InputType()
export class TopUpWalletInput {
  @Field(() => ID)
  gatewayId: number;
  amount: number;
  currency: string;
  token?: string;
  pin?: number;
  otp?: number;
  transactionId?: string;
}

@ObjectType()
export class TopUpWalletResponse {
  status: TopUpWalletStatus;
  url: string;
}