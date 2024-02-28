import { HttpService } from "@nestjs/axios";
import { BadRequestException, HttpException, Injectable } from "@nestjs/common";
import { firstValueFrom } from "rxjs";
import { CurrentConfiguration, UpdateConfigResult, UpdateConfigStatus, UpdatePurchaseCodeClient, UpdatePurchaseCodeResult, UpdatePurchaseCodeStatus } from "./config.dto";
import * as fs from 'fs';
import * as util from 'util';
import { join } from 'path';
import * as fastify from "fastify";
import { pipeline } from "stream";

const pump = util.promisify(pipeline);

@Injectable()
export class ConfigurationService {
    constructor(
        private httpService: HttpService
    ) { }

    async getConfiguration(): Promise<CurrentConfiguration | null> {
        const configAddress = `${process.cwd()}/config/config.${process.env.NODE_ENV}.json`;
        if (fs.existsSync(configAddress)) {
            const file = await fs.promises.readFile(configAddress, { encoding: 'utf-8' });
            const config: CurrentConfiguration = JSON.parse(file as string);
            const firebaseKeyFileAddress = `${process.cwd()}/config/${config.firebaseProjectPrivateKey}`;
            if (
                config.firebaseProjectPrivateKey != null &&
                fs.existsSync(firebaseKeyFileAddress)
            ) {
                return {
                    adminPanelAPIKey: config.adminPanelAPIKey,
                    backendMapsAPIKey: 'RESTRICTED',
                    purchaseCode: 'RESTRICTED',
                    firebaseProjectPrivateKey: 'RESTRICTED'
                };
            }
            return config;
        } else {
            return new CurrentConfiguration();
        }
    }

    async saveConfiguration(newConfig: Partial<CurrentConfiguration>): Promise<boolean> {
        const config = await this.getConfiguration();
        const finalConfig = Object.assign(config, newConfig);
        const str = JSON.stringify(finalConfig);
        await fs.promises.mkdir(`${process.cwd()}/config`, { recursive: true });
        await fs.promises.writeFile(`${process.cwd()}/config/config.${process.env.NODE_ENV}.json`, str);
        return true;
    }

    async updatePurchaseCode(code: string): Promise<UpdatePurchaseCodeResult> {
        const result = await firstValueFrom(this.httpService.get<{ status: 'OK' | 'USED' | string, clients?: UpdatePurchaseCodeClient[] }>(`http://31.220.15.49:9000/verify?purchaseCode=${code}&port=${process.env.MAIN_PORT}`));
        if (result.data.status == 'OK') {
            await this.saveConfiguration({ purchaseCode: code });
            return {
                status: UpdatePurchaseCodeStatus.OK
            };
        } else if (result.data.status == 'USED') {
            return {
                status: UpdatePurchaseCodeStatus.CLIENT_FOUND,
                clients: result.data.clients
            };
        } else {
            return {
                status: UpdatePurchaseCodeStatus.INVALID
            }
        }
    }

    async updateMapsAPIKey(backend: string, adminPanel: string): Promise<UpdateConfigResult> {
        await this.saveConfiguration({ backendMapsAPIKey: backend, adminPanelAPIKey: adminPanel });
        return {
            status: UpdateConfigStatus.OK
        };
    }

    async updateFirebase(keyFileName: string): Promise<UpdateConfigResult> {
        await this.saveConfiguration({ firebaseProjectPrivateKey: keyFileName });
        return {
            status: UpdateConfigStatus.OK
        };
    }

    async disablePreviousServer(ip: string): Promise<UpdateConfigResult> {
        const result = await firstValueFrom(this.httpService.get<{ status: 'OK' }>(`http://31.220.15.49:9000/disable_one?ip=${ip}`));
        if (result.data.status == 'OK') {
            return { status: UpdateConfigStatus.OK };
        } else {
            return { status: UpdateConfigStatus.INVALID };
        }
    }

    async uploadFile(req: any, res: fastify.FastifyReply<any>, dir: string, fileNamePrefix?: string) {
        let _fileName = '';
        const data = await req.file();
        await fs.promises.mkdir(dir, { recursive: true });
        _fileName = join(dir, fileNamePrefix != null ? `${fileNamePrefix}-${data.filename}` : data.filename);
        await pump(data.file, fs.createWriteStream(_fileName));
        res.code(200).send({ address: _fileName });
    }
}