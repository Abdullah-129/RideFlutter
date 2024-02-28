import { FirebaseAuthenticationService } from '@aginix/nestjs-firebase-admin';
import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { RiderEntity } from '@ridy/database/rider-entity';
import { SharedRiderService } from '@ridy/order/shared-rider.service';


@Injectable()
export class AuthService {
  constructor(
    private riderService: SharedRiderService,
    private jwtService: JwtService,
    private firebaseAuth: FirebaseAuthenticationService
  ) {}

  async validateUser(firebaseToken: string): Promise<RiderEntity> {
    const decodedToken = await this.firebaseAuth.app.auth().verifyIdToken(firebaseToken);
    const number = (decodedToken.firebase.identities.phone[0] as string).substring(1);
    const user = await this.riderService.findOrCreateUserWithMobileNumber(number);
    return user;
  }

  async loginUser(user: RiderEntity): Promise<TokenObject> {
    const payload = { id: user.id };
    return {
      token: this.jwtService.sign(payload)
    };
  }
}

export type TokenObject = { token: string };
