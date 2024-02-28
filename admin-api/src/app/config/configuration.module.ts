import { HttpModule } from "@nestjs/axios";
import { Module } from "@nestjs/common";
import { ConfigurationController } from "./configuration.controller";
import { ConfigurationResolver } from "./configuration.resolver";
import { ConfigurationService } from "./configuration.service";

@Module({
    imports: [
        HttpModule,
    ],
    providers: [
        ConfigurationService,
        ConfigurationResolver
    ],
    controllers: [
        ConfigurationController
    ]
})
export class ConfigurationModule {}