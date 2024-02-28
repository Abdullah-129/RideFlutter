import { FirebaseAuthenticationService } from '@aginix/nestjs-firebase-admin';
import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { DriverEntity } from '@ridy/database/driver.entity';

import { DriverService } from '../driver/driver.service';

@Injectable()
export class AuthService {
  constructor(
    private driverService: DriverService,
    private jwtService: JwtService,
    private firebaseAuth: FirebaseAuthenticationService
  ) {}

  async validateUser(firebaseToken: string): Promise<DriverEntity> {
    const decodedToken = await this.firebaseAuth.app.auth().verifyIdToken(firebaseToken);
    const number = (decodedToken.firebase.identities.phone[0] as string).substring(1);
    const user = await this.driverService.findOrCreateUserWithMobileNumber(number);
    return user;
  }

  async loginUser(user: DriverEntity): Promise<TokenObject> {
    const payload = { id: user.id };
    return {
      token: this.jwtService.sign(payload)
    };
  }
}

export type TokenObject = { token: string };
