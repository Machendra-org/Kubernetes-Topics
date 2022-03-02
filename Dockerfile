FROM node:alpine
MAINTAINER kurubamachendrappa025@gamil.com
COPY ./ /app/
WORKDIR /app
RUN npm install
EXPOSE 3000
ENTRYPOINT [ "npm", "start" ]
