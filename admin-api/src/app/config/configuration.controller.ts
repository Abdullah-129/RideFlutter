import { Controller, Post, Req, Res } from "@nestjs/common";
import { UploadService } from "../upload/upload.service";
import * as fastify from 'fastify';
import { ConfigurationService } from "./configuration.service";

@Controller('config')
export class ConfigurationController {
    constructor(
        private configurationService: ConfigurationService
    ) {}

    @Post('upload')
    async upload(@Req() req: fastify.FastifyRequest, @Res() res: fastify.FastifyReply) {
        this.configurationService.uploadFile(req, res, 'config');
    }
}