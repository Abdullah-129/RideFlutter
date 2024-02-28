import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Query, Resolver } from '@nestjs/graphql';
import { OperatorDTO } from '../operator/dto/operator.dto';

import { AuthService } from './auth.service';
import { UserContext } from './authenticated-admin';
import { TokenObject } from './dto/token.dto';
import { JwtAuthGuard } from './jwt-auth.guard';

@Resolver()
export class AuthResolver {
  constructor(
    private authService: AuthService,
    @Inject(CONTEXT) private context: UserContext) {}

  //@UseGuards(LocalAdminAuthGuard)
  @Query(() => TokenObject)
  async login(@Args('userName', { type: () => String}) userName: string, @Args('password', { type: () => String}) password: string): Promise<TokenObject> {
    const token = await this.authService.loginAdmin({userName, password});
    return {
      token
    };
  }

  @Query(() => OperatorDTO)
  @UseGuards(JwtAuthGuard)
  async me(): Promise<OperatorDTO> {
    return this.authService.getAdmin(this.context.req.user.id);
  }
}
