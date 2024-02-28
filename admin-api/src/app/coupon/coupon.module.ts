import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { CouponEntity } from '@ridy/database/coupon.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { CouponDTO } from './dto/coupon.dto';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([CouponEntity])],
            resolvers: [
                {
                    EntityClass: CouponEntity,
                    DTOClass: CouponDTO,
                    create: { many: { disabled: true } },
                    update: { many: { disabled: true } },
                    delete: { disabled: true },
                    pagingStrategy: PagingStrategies.OFFSET,
                    enableTotalCount: true,
                    guards: [JwtAuthGuard]
                }
            ]
        })
    ]
})
export class CouponModule { }
