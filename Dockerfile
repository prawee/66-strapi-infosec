# original image
FROM node:16
# update os and install some library
RUN apt-get update && apt-get install libvips-dev -y
# setup environment
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
# set working directory
WORKDIR /opt/
# copy install file
# COPY ./package.json ./yarn.lock ./  
COPY ./package.json ./
# setup environment for path
ENV PATH /opt/node_modules/.bin:$PATH
# config global and install library for this project
RUN yarn config set network-timeout 600000 -g && yarn install

WORKDIR /opt/app
COPY ./ .
RUN yarn build
EXPOSE 3000
CMD ["yarn", "start"]