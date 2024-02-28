import { BadRequestException, HttpException, Injectable, Logger } from '@nestjs/common';

import * as fs from 'fs';
import stream = require('stream');
import * as util from 'util';
import { join } from 'path';
import * as fastify from "fastify";


@Injectable()
export class UploadService {
  // upload file
  async uploadFile(req: any, res: fastify.FastifyReply<any>): Promise<any> {
    //Check request is multipart
    if (!req.isMultipart()) {
      res.send(new BadRequestException());
      return
    }
    let _fileName = '';
    const mp = await req.multipart(
      async (field: string, file: any, filename: string, encoding: string, mimetype: string): Promise<void> => {
        const pipeline = util.promisify(stream.pipeline);
        await fs.promises.mkdir('uploads', { recursive: true });
        _fileName = join('uploads', `${new Date().getTime()}-${filename}`);
        //_fileName = `${new Date().getTime()}-${filename}`;
        const writeStream = fs.createWriteStream(join(process.cwd(), _fileName));
        try {
          await pipeline(file, writeStream);
        } catch (err) {
          console.error('Pipeline failed', err);
        }
      }, (err?: any) => {
        if (err) {
          res.send(new HttpException('Internal server error', 500))
          return
        }
        res.code(200).send({address: _fileName});
      });
    // for key value pairs in request
    mp.on('field', function (key: any, value: any) {
      //console.log('form-data', key, value);
    });
  }

}
