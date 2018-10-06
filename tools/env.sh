#!/bin/bash
set -eu
set -o pipefail

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"

export TEFI_HOME="$(dirname $(readlink -f "$0"))"
export TEFI_DIST="${TEFI_HOME}/dist"
export TEFI_TMP="${TEFI_HOME}/tmp"

export PATH="${HOME}/local/bin:${PATH}"
