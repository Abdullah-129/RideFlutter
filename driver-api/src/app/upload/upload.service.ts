import { BadRequestException, HttpException, Injectable, Logger } from '@nestjs/common';

import * as fs from 'fs';
import stream = require('stream');
import * as util from 'util';
import { join } from 'path';
import * as fastify from "fastify";
import { InjectRepository } from '@nestjs/typeorm';
import { MediaEntity } from '@ridy/database/media.entity';
import { Repository } from 'typeorm';
import { DriverEntity } from '@ridy/database/driver.entity';


@Injectable()
export class UploadService {
  constructor(
    @InjectRepository(MediaEntity)
    private mediaRepository: Repository<MediaEntity>,
    @InjectRepository(DriverEntity)
    private driverRepository: Repository<DriverEntity>
  ) {}

  async uploadMedia(req: any, res: fastify.FastifyReply<any>, dir: string, driverId: number, type: 'PROFILE' | 'DOCUMENT', fileNamePrefix?: string): Promise<string | null> {
    //Check request is multipart
    if (!req.isMultipart()) {
      res.send(new BadRequestException());
      return
    }
    let _fileName = '';
    const mp = await req.multipart(
      async (field: string, file: any, filename: string, encoding: string, mimetype: string): Promise<void> => {
        const pipeline = util.promisify(stream.pipeline);
        await fs.promises.mkdir(dir, { recursive: true });
        _fileName = join(dir, fileNamePrefix != null ? `${fileNamePrefix}-${filename}` : filename);
        const writeStream = fs.createWriteStream(join(process.cwd(), _fileName));
        try {
          await pipeline(file, writeStream);
        } catch (err) {
          console.error('Pipeline failed', err);
        }
      }, async (err?: any) => {
        if (err) {
          res.send(new HttpException('Internal server error', 500))
          return;
        }
        if(type == 'PROFILE') {
          const insert = await this.mediaRepository.insert({address: _fileName });
          await this.driverRepository.update(driverId, { mediaId: insert.raw.insertId });
          res.code(200).send({id: insert.raw.insertId, address: _fileName });
        } else {
          const insert = await this.mediaRepository.insert({address: _fileName, driverDocumentId: driverId });
          res.code(200).send({id: insert.raw.insertId, address: _fileName });
        }
      });
    // for key value pairs in request
    // mp.on('field', function (key: any, value: any) {
    //   //console.log('form-data', key, value);
    // });
  }
}
