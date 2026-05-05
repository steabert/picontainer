#!/usr/bin/bash
pi_version=$(npm info @mariozechner/pi-coding-agent version)
podman build -t picon --build-arg=PI_VERSION=$pi_version .
