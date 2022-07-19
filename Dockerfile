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
COPY --from=build-stage /app/.output/ ./.output
ENV HOST 0.0.0.0
EXPOSE 3000:8080
ENTRYPOINT [ "yarn", "start" ]