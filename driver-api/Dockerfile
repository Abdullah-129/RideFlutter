FROM node:16.13.1-alpine AS build
WORKDIR /app
COPY ./package.json ./package-lock.json ./decorate-angular-cli.js ./angular.json ./nx.json ./tsconfig.base.json ./
RUN npm i --force
COPY ./apps/driver-api ./apps/driver-api
COPY ./libs/database ./libs/database
RUN npx nx build driver-api --prod

FROM node:16.13.1-alpine
WORKDIR /app
COPY --from=build /app/dist/apps/driver-api/package.json ./
RUN npm i --force
RUN npm i mysql
COPY --from=build /app/dist/apps/driver-api ./
EXPOSE 3002
CMD ["node", "main.js"]