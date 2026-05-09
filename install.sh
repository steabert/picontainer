#!/usr/bin/bash
bash ./build.sh

mkdir -p ~/.local/bin
install run.sh ~/.local/bin/picon
install shell.sh ~/.local/bin/piconsh

mkdir -p ~/.pi/agent
