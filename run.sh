#!/usr/bin/bash
if [[ "$PWD" == "$HOME" ]]; then
  echo "not allowed to run in user's home directory"
  exit 1
fi
create_backup() {
  pushd $HOME/.pi
  for file in agent/auth.json agent/settings.json agent/models.json agent/themes; do
    if [[ -e "$file" ]]; then
      tar rf agent.tar "$file"
    fi
  done
  hash=$(sha1sum agent.tar | awk '{print $1}')
  mv agent.tar agent-${hash}.tar
  popd
}
podman run --rm -ti --userns keep-id:uid=1000,gid=1000 \
  -v $HOME/.pi/agent:/home/node/.pi/agent:z \
  -v $PWD:/home/node/app:z \
  localhost/picon:latest
trap create_backup EXIT
echo "picon exited"
