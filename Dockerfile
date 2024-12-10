FROM node:22.12.0-alpine3.21
RUN apk add --no-cache --update openssh-client rsync curl bash && rm -rf /var/cache/apk/*
WORKDIR /data
CMD sleep 99999
