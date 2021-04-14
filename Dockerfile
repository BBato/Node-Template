FROM node:12-alpine AS builder

RUN mkdir -p /app
WORKDIR /app

COPY package.json  .
COPY yarn.lock .
RUN yarn install

COPY . .

  
FROM tsl0922/ttyd
ARG PORT

EXPOSE $PORT
CMD [ "ttyd", "--port", "$PORT", "bash" ]
