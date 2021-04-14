FROM node:12-alpine AS builder

RUN mkdir -p /app
WORKDIR /app

COPY package.json  .
COPY yarn.lock .
RUN yarn install

COPY . .
ENV PORT

EXPOSE $PORT
CMD [ "yarn", "run", "start" ]
