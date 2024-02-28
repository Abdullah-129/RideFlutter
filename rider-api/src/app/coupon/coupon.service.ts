import { forwardRef, Inject, Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { CouponEntity } from "@ridy/database/coupon.entity";
import { RiderRechargeTransactionType } from "@ridy/database/enums/rider-recharge-transaction-type.enum";
import { TransactionAction } from "@ridy/database/enums/transaction-action.enum";
import { TransactionStatus } from "@ridy/database/enums/transaction-status.enum";
import { GiftCardEntity } from "@ridy/database/gift-card.entity";
import { RequestEntity } from "@ridy/database/request.entity";
import { SharedOrderService } from "@ridy/order/shared-order.service";
import { SharedRiderService } from "@ridy/order/shared-rider.service";
import { ForbiddenError } from "apollo-server-core";
import { Repository } from "typeorm";
import { RiderWalletDTO } from "../wallet/dto/rider-wallet.dto";

@Injectable()
export class CouponService {
    constructor(
        @InjectRepository(CouponEntity)
        private giftCardRepo: Repository<GiftCardEntity>,
        private sharedRiderService: SharedRiderService
    ) { }

    

    async redeemGiftCard(code: string, riderId: number): Promise<RiderWalletDTO> {
        const card = await this.giftCardRepo.findOne({ code });
        if (card == null) throw new ForbiddenError('Invalid code');
        await this.giftCardRepo.update(card.id, { isUsed: true });
        return this.sharedRiderService.rechargeWallet({
            riderId,
            action: TransactionAction.Recharge,
            rechargeType: RiderRechargeTransactionType.Gift,
            status: TransactionStatus.Done,
            currency: card.currency,
            amount: card.amount,
            giftCardId: card.id
        });
    }
}