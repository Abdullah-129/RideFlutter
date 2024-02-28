import {
  IDField,
  Relation,
  UnPagedRelation,
} from '@nestjs-query/query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { MediaDTO } from '../../upload/media.dto';
import { RiderWalletDTO } from './rider-wallet.dto';

@ObjectType('Rider')
@Relation('media', () => MediaDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('wallets', () => RiderWalletDTO, {
  disableRemove: true,
  disableUpdate: true,
})
export class RiderDTO {
  @IDField(() => ID)
  id!: number;
  firstName?: string;
  lastName?: string;
  mobileNumber: string;
}
