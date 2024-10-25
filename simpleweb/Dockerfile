# specify base image
FROM node:14-alpine

WORKDIR /user/app
# install dependencies
COPY ./package.json ./
RUN npm install

# then copy the rest of project files
COPY ./ ./

# default command
CMD ["npm", "start"]