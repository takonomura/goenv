#!/bin/sh
# Usage: PREFIX=/usr/local ./install.sh
#
# Installs go-build under $PREFIX.

set -e

cd "$(dirname "$0")"

if [ -z "${PREFIX}" ]; then
  PREFIX="/usr/local"
fi

BIN_PATH="${PREFIX}/bin"
SHARE_PATH="${PREFIX}/share/go-build"

mkdir -p "$BIN_PATH" "$SHARE_PATH"

install -p bin/* "$BIN_PATH"
for share in share/go-build/*; do
  if [ -d "$share" ]; then
    cp -RPp "$share" "$SHARE_PATH"
  else
    install -p -m 0644 "$share" "$SHARE_PATH"
  fi
done
