FROM node:22.12-bookworm
RUN apt-get update && apt-get install -y openssh-client rsync curl ca-certificates && apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /data
CMD sleep 99999
