FROM node

RUN mkdir /usr/src/app
COPY ./app.js /usr/src/app
EXPOSE 3000

WORKDIR /usr/src/app
CMD node app
