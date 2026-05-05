# Use a Node.js base image
FROM node:24-alpine

# Install dependencies
RUN apk add --no-cache curl git fd ripgrep

# Install the Pi coding agent
ARG PI_VERSION="latest"
RUN npm install -g @mariozechner/pi-coding-agent@${PI_VERSION}

RUN su - node
RUN mkdir -p /home/node/.pi/agent
RUN mkdir -p /home/node/app

WORKDIR /home/node/app

# Set the default command to run the coding agent
ENTRYPOINT ["/usr/local/bin/pi"]
