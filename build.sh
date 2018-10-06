#!/bin/bash
set -eu
set -o pipefail
source "$(dirname $(readlink -f "$0"))/tools/env.sh"

mkdir -p "${TEFI_DIST}" "${TEFI_TMP}"
cd "${TEFI_HOME}"

set -x
terra -g src/project.t tmp/project.ll
llc -filetype=asm -o=tmp/project.s -code-model=large -disable-fp-elim tmp/project.ll
x86_64-w64-mingw32-gcc -nostdlib -Wl,-dll -shared -Wl,--subsystem,10 -e efi_main -o dist/project.efi tmp/project.s
file dist/project.efi
