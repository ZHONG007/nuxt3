# ================
# == BASE STAGE ==
# ================
FROM node:lts-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN yarn install
COPY . .
RUN yarn build

# production stage
FROM node:lts-alpine as production-stage
COPY --from=build-stage /app/.output/ /app/.output
EXPOSE 3000 
USER node
ENTRYPOINT ["node", ".output/server/index.mjs"]