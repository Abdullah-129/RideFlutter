import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { RiderAPIModule } from './app/rider-api.module';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';
import fastifyStatic from '@fastify/static';
import fastifyMultipart from '@fastify/multipart';
import { join } from 'path';

async function bootstrap() {
  const adapter = new FastifyAdapter();
  const app = await NestFactory.create<NestFastifyApplication>(
    RiderAPIModule,
    adapter
  );

  const port = process.env.RIDER_API_PORT || 3000;
  app.enableShutdownHooks();
  app.enableCors();
  app.register(fastifyMultipart);
  app.register(fastifyStatic, {
    prefix: '/uploads/',
    root: join(process.cwd(), 'uploads'),
  });
  await app.listen(port, '0.0.0.0', () => {
    Logger.log('Listening at http://localhost:' + port, 'Rider API');
  });
}

bootstrap();
