import { Module } from '@nestjs/common';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { OperatorModule } from '../operator/operator.module';

import { AuthResolver } from './auth.resolver';
import { AuthService } from './auth.service';
import { JwtStrategy } from './jwt.strategy';

@Module({
    imports: [
        OperatorModule,
        PassportModule,
        JwtModule.register({
            secret: 'secret'
        })
    ],
    providers: [
        JwtStrategy,
        AuthService,
        AuthResolver
    ]
})
export class AuthModule { }
