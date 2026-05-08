# Use a Node.js base image
FROM node:24-alpine

# Install dependencies
RUN apk add --no-cache curl git fd ripgrep

# Install the Pi coding agent
ARG PI_VERSION="latest"
RUN npm install -g @earendil-works/pi-coding-agent@${PI_VERSION}

# Disable update checks and telemetry
ENV PI_OFFLINE=1

# Switch to non-root user
USER node

# Set the default command to run the coding agent
ENTRYPOINT ["/usr/local/bin/pi"]
