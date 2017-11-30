FROM node:6.12-alpine

WORKDIR /app

RUN mkdir MovieCruiser

RUN mkdir webserver

COPY MovieCruiser/package.json /app/MovieCruiser/
RUN cd MovieCruiser; npm install

COPY webserver/package.json /app/webserver/
RUN cd webserver; npm install

COPY . .
RUN cd MovieCruiser; npm run build
RUN npm install; npm cache clean


EXPOSE 3000
