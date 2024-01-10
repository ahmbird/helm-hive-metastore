#!/usr/bin/env bash

# To build Locally use this script
set -e
set +x

PLATFORM=""
if [[ "$1" == "--arm64" ]]; then
  PLATFORM="linux/arm64";
elif [[ "$1" == "--amd64" ]]; then
  PLATFORM="linux/amd64"
else
  echo "ERROR: unknown platform specifier - $1. Only --arm64 or --amd64 is supported"
  exit 1
fi

docker build  --no-cache --platform "${PLATFORM}" -t "$2"  -f ./Dockerfile .