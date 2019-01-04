FROM node:alpine

RUN mkdir /usr/src
COPY ./app.js /usr/src
EXPOSE 3000

WORKDIR /usr/src
CMD node app
