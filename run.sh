#!/usr/bin/bash
podman run --rm -ti --userns keep-id:uid=1000,gid=1000 \
  -v $HOME/.pi:/home/node/.pi:z \
  -v $PWD:/home/node/app:z \
  localhost/picon:latest
