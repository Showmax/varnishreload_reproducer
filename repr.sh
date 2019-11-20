#!/bin/bash

set -e
set -u

PAGESIZE=$(getconf PAGESIZE)
PIPE_DEFAULT_SIZE=$((16 * PAGESIZE))

TMPDIR="$(mktemp -d -p /tmp)"
trap 'rm -rf "${TMPDIR}"' EXIT

VCL="${TMPDIR}/generated.vcl"
cat > "${VCL}" <<EOF
// VCL.SHOW 0 0 /tmp/file with 3 spaces.vcl
EOF

dd if=/dev/urandom count=1 bs=$(( 2 * PIPE_DEFAULT_SIZE )) 2>/dev/null | base64 >> "${VCL}"
VCL_CONTENTS="$(cat ${VCL})"
echo "${VCL_CONTENTS}" | awk '$1 == "//" && $2 == "VCL.SHOW" {print; exit}' > /dev/null
echo "echo's return status in the shell: ${PIPESTATUS[0]}"
