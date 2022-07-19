# ================
# == BASE STAGE ==
# ================
FROM node:18-alpine as base

# create destination directory
RUN mkdir -p /usr/src/nuxt-app
WORKDIR /usr/src/nuxt-app

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

# copy the app, note .dockerignore
COPY . /usr/src/nuxt-app/
RUN yarn install
RUN yarn build

FROM node:18-alpine
# build necessary, even if no static files are needed,
# since it builds the server as well
COPY --from=base /usr/src/nuxt-app/.output /.output

# expose 5000 on container
EXPOSE 8080

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=8080

# start the app
CMD [ "yarn", "start" ]


