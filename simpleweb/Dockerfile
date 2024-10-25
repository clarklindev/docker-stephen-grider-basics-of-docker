# specify base image
FROM node:14-alpine

WORKDIR /user/app
# install dependencies
COPY ./ ./
RUN npm install

# default command
CMD ["npm", "start"]