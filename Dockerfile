FROM node:8.1.4-alpine

RUN apk add --no-cache make gcc g++ python openjdk8

RUN yarn global add allure-commandline && \
  apk del make gcc g++ python

ENTRYPOINT ["allure"]
