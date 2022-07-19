# ================
# == BASE STAGE ==
# ================
FROM node:lts-alpine as build-stage
WORKDIR /usr/src/app
COPY . ./
RUN yarn

EXPOSE 8080

ENV HOST=0.0.0.0
ENV PORT=8080

RUN yarn build

CMD [ "yarn", "start" ]
# production stage
FROM node:lts-alpine as production-stage
COPY --from=build-stage /usr/src/app/ ./.output

EXPOSE 8080
ENV HOST='0.0.0.0'
ENV PORT='3000'
EXPOSE 3000
ENTRYPOINT [ "yarn", "start" ]