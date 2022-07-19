# nuxt3-naive-ui-starter
everything works fine

> Nuxt3全自动按需引入naive-ui，vite极速开发、SEO友好。流量入口，我们来啦！

<p align="center">
  <br>
  <a href="https://nuxt3-naive-ui.netlify.app/" target="_blank">
    Live Demo
  </a>
  <br>
  <a href="https://stackblitz.com/github/Baiyuetribe/nuxt3-naive-ui-starter" title="Open In Stackblitz">
    <img src="https://developer.stackblitz.com/img/open_in_stackblitz.svg" alt="Open In Stackblitz">
  </a>
</p>
    // "start": "cross-env PORT=8080 node .output/server/index.mjs"
We recommend to look at the [documentation](https://v3.nuxtjs.org).

## Example
[Online DEMO](https://duhaoshu.cc)

[阿里云盘资源网](https://www.aliyunpanziyuan.com/)

## Usages

```bash
git clone https://github.com/Baiyuetribe/nuxt3-naive-ui-starter.git
cd nuxt3-naive-ui-starter 
yarn install
yarn dev
```
## Dependencies

- [TuSimple/naive-ui](https://github.com/TuSimple/naive-ui)
- [nuxt/framework](https://github.com/nuxt/framework)

# ================
# == BASE STAGE ==
# ================
FROM node:18-alpine as base

WORKDIR /app

COPY package.json yarn.lock* ./

# =============
# == BUILDER ==
# =============
FROM base as builder

# Install all depencies to build
RUN yarn install --production=false

COPY . /app/

RUN yarn build

# ======================
# == PRODUCTION STAGE ==
# ======================
FROM base as production

ENV NODE_ENV=production

# Install pm2 to run app in production:
RUN npm install pm2 -g

# Add pm2 configuration:
COPY --chown=node:node ./ecosystem.config.js /app/

# Install only production packages
RUN yarn --frozen-lockfile --production

# To have lightest as possible, take only built files:
COPY --from=builder --chown=node:node /app/.output/ /app/.output

# Change user to "node" to improve security in production:
USER node

CMD [ "yarn", "start" ]