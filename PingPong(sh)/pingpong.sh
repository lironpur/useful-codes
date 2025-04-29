#!/bin/bash

subnet=$1

trap "echo -e '\nStopped by user'; exit" SIGINT

for i in {1..254}; do
  ip="${subnet}.${i}"
  if ping -c 1 -W 1 "$ip" &> /dev/null; then
    echo "$ip is up"
  fi
done
