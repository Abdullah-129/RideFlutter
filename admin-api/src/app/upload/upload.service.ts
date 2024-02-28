import { BadRequestException, HttpException, Injectable, Logger } from '@nestjs/common';

import * as fs from 'fs';
import stream = require('stream');
import * as util from 'util';
import { join } from 'path';
import * as fastify from "fastify";
import { Repository } from 'typeorm';
import { MediaEntity } from '@ridy/database/media.entity';
import { InjectRepository } from '@nestjs/typeorm';
import { pipeline } from 'stream';

const pump = util.promisify(pipeline);

@Injectable()
export class UploadService {
  constructor(
    @InjectRepository(MediaEntity)
    private mediaRepository: Repository<MediaEntity>
  ) { }

  async uploadMedia(req: any, res: fastify.FastifyReply<any>, dir: string, fileNamePrefix?: string): Promise<string | null> {
    //Check request is multipart
    if (!req.isMultipart()) {
      res.send(new BadRequestException());
      return
    }
    const data = await req.file();
    await fs.promises.mkdir(dir, { recursive: true });
    const _fileName = join(dir, fileNamePrefix != null ? `${fileNamePrefix}-${data.filename}` : data.filename);
    await pump(data.file, fs.createWriteStream(_fileName));
    const insert = await this.mediaRepository.insert({ address: _fileName });
    res.code(200).send({ id: insert.raw.insertId, address: _fileName });
  }
}
