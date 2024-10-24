# use an existing image as a base
FROM alpine

# download and install a dependency
RUN apk add --update redis

# tell image what to do when it starts a container
CMD ["redis-server"]