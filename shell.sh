#!/usr/bin/bash
if [[ "$1" == "clear" ]]; then
  podman volume rm piconhome
elif [[ -n "$1" ]]; then
  echo "Error: Unknown argument '$1'" >&2
  exit 1
fi
podman run --rm -ti --userns keep-id:uid=1000,gid=1000 \
  -v piconhome:/home/pi:z \
  -v $HOME/.pi/agent:/opt/pi/agent:z \
  -e PI_CODING_AGENT_DIR=/opt/pi/agent \
  --entrypoint /bin/sh \
  localhost/picon:latest
