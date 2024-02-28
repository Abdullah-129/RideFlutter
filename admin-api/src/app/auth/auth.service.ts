import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { OperatorEntity } from '@ridy/database/operator.entity';
import { ForbiddenError } from 'apollo-server-fastify';
import { OperatorService } from '../operator/operator.service';

@Injectable()
export class AuthService {
  constructor(private jwtService: JwtService, private adminService: OperatorService) {}

  async getAdmin(id: number): Promise<OperatorEntity> {
    return this.adminService.getById(id);
  }

  async loginAdmin(args: {userName: string, password: string}): Promise<string> {
    const admin = await this.adminService.validateCredentials(args.userName, args.password);
    if(admin == null) {
      throw new ForbiddenError('Invalid Credentials');
    }
    return this.jwtService.sign({ id: admin.id });
  }
}


