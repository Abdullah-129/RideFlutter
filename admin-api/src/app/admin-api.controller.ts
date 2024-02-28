import { Controller, Get, Post, Req, Res, UseGuards } from '@nestjs/common';
import * as fastify from 'fastify';
import { rm } from 'fs/promises';

import { RestJwtAuthGuard } from './auth/rest-jwt-auth.guard';
import { UploadService } from './upload/upload.service';
import { version } from "package.json";

@Controller()
export class AppController {
    constructor(
        private uploadService: UploadService
    ) { }

    @Get()
    async defaultPath(@Res() res: fastify.FastifyReply) {
        res.send(`✅ Admin API microservice running.\nVersion: ${version}`);
    }

    @Post('upload')
    @UseGuards(RestJwtAuthGuard)
    async upload(@Req() req: fastify.FastifyRequest, @Res() res: fastify.FastifyReply) {
        await this.uploadService.uploadMedia(req, res, 'uploads', (new Date().getTime()).toString());
    }

    @Get('reconfig')
    async reconfig(@Req() req: fastify.FastifyRequest, @Res() res: fastify.FastifyReply) {
        const configAddress = `${process.cwd()}/config/config.${process.env.NODE_ENV}.json`;
        await rm(configAddress);
        process.exit(1);
    }
}
