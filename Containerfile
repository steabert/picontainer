FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl git fd ripgrep go nodejs npm

# Install the Pi coding agent, disable update checks and telemetry
ARG PI_VERSION="latest"
RUN npm install -g @earendil-works/pi-coding-agent@${PI_VERSION}
ENV PI_OFFLINE=1

# Switch to non-root user
RUN addgroup --gid 1000 pi
RUN adduser --uid 1000 -S pi
USER pi
WORKDIR /home/pi
ENV PATH=/home/pi/.local/bin:/home/pi/go/bin:$PATH

# Set the default command to run the coding agent
ENTRYPOINT ["/usr/local/bin/pi"]
