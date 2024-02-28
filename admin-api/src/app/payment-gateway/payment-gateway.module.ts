import { NestjsQueryGraphQLModule, PagingStrategies } from '@nestjs-query/query-graphql';
import { NestjsQueryTypeOrmModule } from '@nestjs-query/query-typeorm';
import { Module } from '@nestjs/common';
import { PaymentGatewayEntity } from '@ridy/database/payment-gateway.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { PaymentGatewayDTO } from './dto/payment-gateway.dto';

@Module({
    imports: [
        NestjsQueryGraphQLModule.forFeature({
            imports: [NestjsQueryTypeOrmModule.forFeature([PaymentGatewayEntity])],
            resolvers: [
                {
                    EntityClass: PaymentGatewayEntity,
                    DTOClass: PaymentGatewayDTO,
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
export class PaymentGatewayModule {}
