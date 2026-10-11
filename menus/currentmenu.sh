#!/usr/bin/env bash

# =============================================================================
#                         PARA // INFRASTRUCTURE
#                   FULL COMBINED MANAGEMENT CONSOLE
#
# Credits: Para
# Version: 4.0
#
# Contains:
#   - Original Para Panel Registry
#   - Original Para Server Tools
#   - Pterodactyl tools
#   - VPS tools
#   - Cloudflare tools
#   - Backup / Nginx / Theme / Playit
#   - System Information
# =============================================================================

# -----------------------------------------------------------------------------
# COLORS
# -----------------------------------------------------------------------------

ESC=$'\033'

RESET="${ESC}[0m"
BOLD="${ESC}[1m"
DIM="${ESC}[2m"

BLACK="${ESC}[30m"
RED="${ESC}[31m"
GREEN="${ESC}[32m"
YELLOW="${ESC}[33m"
BLUE="${ESC}[34m"
MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m"
WHITE="${ESC}[37m"

GRAY="${ESC}[90m"

BRIGHT_RED="${ESC}[91m"
BRIGHT_GREEN="${ESC}[92m"
BRIGHT_YELLOW="${ESC}[93m"
BRIGHT_BLUE="${ESC}[94m"
BRIGHT_MAGENTA="${ESC}[95m"
BRIGHT_CYAN="${ESC}[96m"
BRIGHT_WHITE="${ESC}[97m"

# -----------------------------------------------------------------------------
# CONFIG
# -----------------------------------------------------------------------------

VERSION="4.0"
AUTHOR="Para"

# -----------------------------------------------------------------------------
# MODULE REGISTRY
# -----------------------------------------------------------------------------

declare -A MODULE_NAME
declare -A MODULE_URL
declare -A MODULE_CATEGORY
declare -A MODULE_DESCRIPTION

# =============================================================================
# ORIGINAL PANEL REGISTRY
# =============================================================================

MODULE_NAME[1]="Pterodactyl Hub"
MODULE_URL[1]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/PterodactylHub"
MODULE_CATEGORY[1]="PANELS"
MODULE_DESCRIPTION[1]="Pterodactyl management hub"

MODULE_NAME[2]="Reviactyl Panel"
MODULE_URL[2]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/Reviactyl_Installer.sh"
MODULE_CATEGORY[2]="PANELS"
MODULE_DESCRIPTION[2]="Reviactyl panel installer"

MODULE_NAME[3]="Jexcatyl Panel"
MODULE_URL[3]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/Jexcatylnstall"
MODULE_CATEGORY[3]="PANELS"
MODULE_DESCRIPTION[3]="Jexcatyl panel installer"

MODULE_NAME[4]="Mythical Dash"
MODULE_URL[4]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/MythicalDash"
MODULE_CATEGORY[4]="PANELS"
MODULE_DESCRIPTION[4]="MythicalDash client area installer"

MODULE_NAME[5]="Cockpit"
MODULE_URL[5]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/CockpitInstall"
MODULE_CATEGORY[5]="PANELS"
MODULE_DESCRIPTION[5]="Cockpit server administration"

MODULE_NAME[6]="WHMCS"
MODULE_URL[6]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/whmcs"
MODULE_CATEGORY[6]="PANELS"
MODULE_DESCRIPTION[6]="WHMCS hosting management"

MODULE_NAME[7]="Convoy"
MODULE_URL[7]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/convoy"
MODULE_CATEGORY[7]="PANELS"
MODULE_DESCRIPTION[7]="Convoy deployment module"

MODULE_NAME[8]="XRDP"
MODULE_URL[8]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/xrdp"
MODULE_CATEGORY[8]="PANELS"
MODULE_DESCRIPTION[8]="Remote desktop installer"

MODULE_NAME[9]="Paymenter"
MODULE_URL[9]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/paymenter"
MODULE_CATEGORY[9]="PANELS"
MODULE_DESCRIPTION[9]="Paymenter billing deployment"

MODULE_NAME[10]="HVM V8"
MODULE_URL[10]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/hvmv8"
MODULE_CATEGORY[10]="PANELS"
MODULE_DESCRIPTION[10]="HVM V8 deployment module"

# =============================================================================
# ORIGINAL SERVER TOOLS
# =============================================================================

MODULE_NAME[11]="Auto Root"
MODULE_URL[11]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/sshfix"
MODULE_CATEGORY[11]="SERVER TOOLS"
MODULE_DESCRIPTION[11]="SSH and root configuration"

MODULE_NAME[12]="Cloudflare Installer"
MODULE_URL[12]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/CloudflareMenu"
MODULE_CATEGORY[12]="SERVER TOOLS"
MODULE_DESCRIPTION[12]="Cloudflare management utility"

MODULE_NAME[13]="Docker VM"
MODULE_URL[13]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/dockercontainer"
MODULE_CATEGORY[13]="SERVER TOOLS"
MODULE_DESCRIPTION[13]="Docker container management"

MODULE_NAME[14]="Local SSL Generator"
MODULE_URL[14]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/SSL%20GENRATOR"
MODULE_CATEGORY[14]="SERVER TOOLS"
MODULE_DESCRIPTION[14]="Local SSL certificate generator"

MODULE_NAME[15]="Swap RAM"
MODULE_URL[15]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/SwapRam"
MODULE_CATEGORY[15]="SERVER TOOLS"
MODULE_DESCRIPTION[15]="Swap memory management"

MODULE_NAME[16]="Nginx Reload"
MODULE_URL[16]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/NginxReload"
MODULE_CATEGORY[16]="SERVER TOOLS"
MODULE_DESCRIPTION[16]="Reload Nginx service"

MODULE_NAME[17]="Blueprint Installer"
MODULE_URL[17]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/BlueprintFix"
MODULE_CATEGORY[17]="SERVER TOOLS"
MODULE_DESCRIPTION[17]="Blueprint installation utility"

MODULE_NAME[18]="VPS Menu"
MODULE_URL[18]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/VpsMenu"
MODULE_CATEGORY[18]="SERVER TOOLS"
MODULE_DESCRIPTION[18]="VPS management toolkit"

MODULE_NAME[19]="Custom MOTD Builder"
MODULE_URL[19]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/customotdbuilder"
MODULE_CATEGORY[19]="SERVER TOOLS"
MODULE_DESCRIPTION[19]="Custom terminal MOTD builder"

# =============================================================================
# PTERODACTYL / NETWORKING / VPS
# =============================================================================

MODULE_NAME[20]="Pterodactyl Panel Installer"
MODULE_URL[20]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/pteroinstall"
MODULE_CATEGORY[20]="PTERODACTYL"
MODULE_DESCRIPTION[20]="Install Pterodactyl Panel"

MODULE_NAME[21]="Pterodactyl Wings"
MODULE_URL[21]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/wingsptero"
MODULE_CATEGORY[21]="PTERODACTYL"
MODULE_DESCRIPTION[21]="Install Pterodactyl Wings"

MODULE_NAME[22]="Pterodactyl Update"
MODULE_URL[22]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/updateptero"
MODULE_CATEGORY[22]="PTERODACTYL"
MODULE_DESCRIPTION[22]="Update Pterodactyl"

MODULE_NAME[23]="Pterodactyl Uninstall"
MODULE_URL[23]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/uninstallptero"
MODULE_CATEGORY[23]="PTERODACTYL"
MODULE_DESCRIPTION[23]="Uninstall Pterodactyl"

MODULE_NAME[24]="Blueprint ParaCom"
MODULE_URL[24]="https://raw.githubusercontent.com/ParaNoob123/Blueprint/refs/heads/main/paracom"
MODULE_CATEGORY[24]="PTERODACTYL"
MODULE_DESCRIPTION[24]="ParaNoob Blueprint installer"

MODULE_NAME[25]="Cloudflare Legacy Installer"
MODULE_URL[25]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/cloudflareinstall"
MODULE_CATEGORY[25]="NETWORKING"
MODULE_DESCRIPTION[25]="Legacy Cloudflare installer"

MODULE_NAME[26]="Theme Installer"
MODULE_URL[26]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/thememenu"
MODULE_CATEGORY[26]="PTERODACTYL"
MODULE_DESCRIPTION[26]="Pterodactyl theme manager"

MODULE_NAME[27]="Playit Setup"
MODULE_URL[27]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/playit"
MODULE_CATEGORY[27]="NETWORKING"
MODULE_DESCRIPTION[27]="Playit networking setup"

MODULE_NAME[28]="Pterodactyl Bot"
MODULE_URL[28]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/PteroBot"
MODULE_CATEGORY[28]="PTERODACTYL"
MODULE_DESCRIPTION[28]="Pterodactyl bot manager"

MODULE_NAME[29]="Backup Manager"
MODULE_URL[29]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/BackUp"
MODULE_CATEGORY[29]="SERVER"
MODULE_DESCRIPTION[29]="Server backup manager"

MODULE_NAME[30]="Nginx Reload Legacy"
MODULE_URL[30]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/NginxReload"
MODULE_CATEGORY[30]="SERVER"
MODULE_DESCRIPTION[30]="Legacy Nginx reload module"

MODULE_NAME[31]="Pterodactyl Restart"
MODULE_URL[31]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/RestartPtero"
MODULE_CATEGORY[31]="PTERODACTYL"
MODULE_DESCRIPTION[31]="Restart Pterodactyl services"

MODULE_NAME[32]="VPS Maker"
MODULE_URL[32]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/VpsMaker"
MODULE_CATEGORY[32]="VPS"
MODULE_DESCRIPTION[32]="VPS creation utility"

# Fixed duplicate ID: Proxmox is 33
MODULE_NAME[33]="Proxmox Installer Debian 13"
MODULE_URL[33]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/proxmoxinstaller"
MODULE_CATEGORY[33]="VPS"
MODULE_DESCRIPTION[33]="Proxmox Installer in Debian 13"

MODULE_COUNT=33

# -----------------------------------------------------------------------------
# TERMINAL
# -----------------------------------------------------------------------------

hide_cursor() {
    printf '\033[?25l'
}

show_cursor() {
    printf '\033[?25h'
}

clear_screen() {
    printf '\033[2J\033[H'
}

cleanup() {
    show_cursor
    printf '%s' "$RESET"
}

trap cleanup EXIT
trap 'show_cursor; exit 130' INT TERM

# -----------------------------------------------------------------------------
# TYPEWRITER
# -----------------------------------------------------------------------------

typewrite() {

    local text="$1"
    local speed="${2:-0.025}"

    local i
    local char

    for ((i=0; i<${#text}; i++)); do

        char="${text:i:1}"

        printf '%s' "$char"

        sleep "$speed"

    done
}

# -----------------------------------------------------------------------------
# SPINNER
# -----------------------------------------------------------------------------

spinner() {

    local message="$1"
    local loops="${2:-12}"

    local frames=(
        "·"
        "•"
        "●"
        "•"
    )

    local i

    for ((i=0; i<loops; i++)); do

        printf '\r  %b%s%b %b%s%b' \
            "$BRIGHT_CYAN" \
            "${frames[$((i % 4))]}" \
            "$RESET" \
            "$WHITE" \
            "$message" \
            "$RESET"

        sleep 0.08
    done

    printf '\r\033[K'
}

# -----------------------------------------------------------------------------
# PROGRESS
# -----------------------------------------------------------------------------

progress() {

    local label="$1"
    local total="${2:-24}"

    local i
    local filled
    local empty

    for ((i=0; i<=total; i++)); do

        filled="$i"
        empty=$((total-i))

        printf '\r  %b%-22s%b [' \
            "$BRIGHT_CYAN" \
            "$label" \
            "$RESET"

        printf '%*s' "$filled" '' | tr ' ' '#'
        printf '%*s' "$empty" '' | tr ' ' '.'

        printf '] %3d%%' "$((i*100/total))"

        sleep 0.025

    done

    printf '\n'
}

# -----------------------------------------------------------------------------
# SYSTEM
# -----------------------------------------------------------------------------

get_cpu() {

    local cpu

    cpu="$(
        top -bn1 2>/dev/null |
        awk '/Cpu\(s\)/ {
            gsub(",", ".", $2)
            gsub(",", ".", $4)
            printf "%.0f", $2+$4
            exit
        }'
    )"

    printf '%s' "${cpu:-0}"
}

get_ram() {

    local ram

    ram="$(
        free 2>/dev/null |
        awk '/^Mem:/ {
            if ($2 > 0)
                printf "%.0f", ($3/$2)*100
            else
                print "0"
        }'
    )"

    printf '%s' "${ram:-0}"
}

get_disk() {

    local disk

    disk="$(df -h / 2>/dev/null | awk 'NR==2 {print $5}')"

    printf '%s' "${disk:-0%}"
}

get_uptime() {

    uptime -p 2>/dev/null |
        sed 's/^up //' ||
        printf 'unknown'
}

get_hostname() {

    hostname 2>/dev/null ||
        printf 'unknown'
}

get_os() {

    if [ -f /etc/os-release ]; then

        . /etc/os-release

        printf '%s' "${PRETTY_NAME:-Linux}"

    else

        printf 'Linux'

    fi
}

# -----------------------------------------------------------------------------
# STATUS
# -----------------------------------------------------------------------------

status_line() {

    local cpu
    local ram
    local disk

    cpu="$(get_cpu)"
    ram="$(get_ram)"
    disk="$(get_disk)"

    printf '  '

    printf '%bCPU%b %b%s%%%b' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_CYAN" \
        "$cpu" \
        "$RESET"

    printf '    '

    printf '%bRAM%b %b%s%%%b' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_MAGENTA" \
        "$ram" \
        "$RESET"

    printf '    '

    printf '%bDISK%b %b%s%b' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_YELLOW" \
        "$disk" \
        "$RESET"

    printf '    '

    printf '%b● ONLINE%b' \
        "$BRIGHT_GREEN" \
        "$RESET"

    printf '\n'
}

# -----------------------------------------------------------------------------
# HEADER
# -----------------------------------------------------------------------------

draw_header() {

    clear_screen

    printf '\n'

    printf '  %b' "$BRIGHT_CYAN$BOLD"
    typewrite "PARA" 0.045
    printf '%b' "$RESET"

    printf ' %b//%b ' "$GRAY" "$RESET"

    printf '%b' "$BRIGHT_WHITE$BOLD"
    typewrite "INFRASTRUCTURE" 0.018
    printf '%b\n' "$RESET"

    printf '  %bserver operations / deployment / automation%b\n' \
        "$GRAY" \
        "$RESET"

    printf '\n'

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$BRIGHT_BLUE" \
        "$RESET"

    printf '  %bHOST%b  %b%s%b' \
        "$GRAY" \
        "$RESET" \
        "$WHITE" \
        "$(get_hostname)" \
        "$RESET"

    printf '    '

    printf '%bOS%b  %b%s%b' \
        "$GRAY" \
        "$RESET" \
        "$WHITE" \
        "$(get_os)" \
        "$RESET"

    printf '    '

    printf '%bVER%b  %b%s%b\n' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_CYAN" \
        "$VERSION" \
        "$RESET"

    status_line

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$BRIGHT_BLUE" \
        "$RESET"
}

# -----------------------------------------------------------------------------
# BOOT
# -----------------------------------------------------------------------------

boot_screen() {

    clear_screen

    printf '\n\n'

    printf '       %b' "$BRIGHT_CYAN$BOLD"
    typewrite "P A R A" 0.09
    printf '%b\n' "$RESET"

    printf '\n'

    printf '       %b' "$BRIGHT_WHITE$BOLD"
    typewrite "INFRASTRUCTURE CONSOLE" 0.035
    printf '%b\n' "$RESET"

    printf '\n'

    printf '       %b' "$GRAY"
    typewrite "33 modules / remote deployment / server operations" 0.012
    printf '%b\n\n' "$RESET"

    progress "loading core" 25
    progress "loading registry" 25
    progress "checking environment" 25

    printf '\n'

    printf '       %b● SYSTEM READY%b\n' \
        "$BRIGHT_GREEN$BOLD" \
        "$RESET"

    sleep 0.6
}

# -----------------------------------------------------------------------------
# CURL
# -----------------------------------------------------------------------------

check_curl() {

    if command -v curl >/dev/null 2>&1; then
        return 0
    fi

    printf '\n'

    printf '  %bCURL IS NOT INSTALLED%b\n' \
        "$BRIGHT_RED$BOLD" \
        "$RESET"

    printf '\n'

    printf '  Attempting installation...\n\n'

    if command -v apt-get >/dev/null 2>&1; then

        apt-get update &&
        apt-get install -y curl

    elif command -v dnf >/dev/null 2>&1; then

        dnf install -y curl

    elif command -v yum >/dev/null 2>&1; then

        yum install -y curl

    elif command -v apk >/dev/null 2>&1; then

        apk add curl

    else

        printf '  %bAutomatic installation unavailable.%b\n' \
            "$BRIGHT_RED" \
            "$RESET"

        return 1
    fi

    command -v curl >/dev/null 2>&1
}

# -----------------------------------------------------------------------------
# PAUSE
# -----------------------------------------------------------------------------

pause() {

    printf '\n'

    printf '  %bPress ENTER to return...%b' \
        "$GRAY" \
        "$RESET"

    read -r
}

# -----------------------------------------------------------------------------
# EXECUTE MODULE
# -----------------------------------------------------------------------------

run_module() {

    local id="$1"

    local name="${MODULE_NAME[$id]}"
    local url="${MODULE_URL[$id]}"
    local category="${MODULE_CATEGORY[$id]}"
    local description="${MODULE_DESCRIPTION[$id]}"

    clear_screen

    printf '\n'

    printf '  %bPARA%b %b// EXECUTION%b\n' \
        "$BRIGHT_CYAN$BOLD" \
        "$RESET" \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$BRIGHT_CYAN" \
        "$RESET"

    printf '\n'

    printf '  %bCATEGORY%b\n' "$GRAY$BOLD" "$RESET"

    printf '  %b%s%b\n\n' \
        "$BRIGHT_MAGENTA" \
        "$category" \
        "$RESET"

    printf '  %b' "$BRIGHT_CYAN$BOLD"
    typewrite "$name" 0.025
    printf '%b\n' "$RESET"

    printf '  %b%s%b\n\n' \
        "$GRAY" \
        "$description" \
        "$RESET"

    # REMOTE SOURCE / URL DISPLAY REMOVED
    # URL is still used internally by curl below.

    printf '  %bMODULE%b  %bREADY%b\n\n' \
        "$GRAY$BOLD" \
        "$RESET" \
        "$BRIGHT_GREEN" \
        "$RESET"

    if ! check_curl; then

        pause
        return
    fi

    local temp_script

    temp_script="$(mktemp 2>/dev/null)"

    if [ -z "$temp_script" ]; then

        printf '\n'

        printf '  %bUnable to create temporary file.%b\n' \
            "$BRIGHT_RED" \
            "$RESET"

        pause
        return
    fi

    spinner "connecting to registry" 14
    spinner "downloading module" 16

    if ! curl \
        --fail \
        --silent \
        --show-error \
        --location \
        --connect-timeout 15 \
        --max-time 120 \
        "$url" \
        -o "$temp_script"; then

        printf '\n'

        printf '  %bDOWNLOAD FAILED%b\n' \
            "$BRIGHT_RED$BOLD" \
            "$RESET"

        rm -f "$temp_script"

        pause
        return
    fi

    if [ ! -s "$temp_script" ]; then

        printf '\n'

        printf '  %bEMPTY MODULE RECEIVED%b\n' \
            "$BRIGHT_RED$BOLD" \
            "$RESET"

        rm -f "$temp_script"

        pause
        return
    fi

    spinner "validating bash syntax" 14

    if ! bash -n "$temp_script" >/dev/null 2>&1; then

        printf '\n'

        printf '  %bSYNTAX CHECK FAILED%b\n' \
            "$BRIGHT_RED$BOLD" \
            "$RESET"

        printf '  %bRemote module was NOT executed.%b\n' \
            "$BRIGHT_YELLOW" \
            "$RESET"

        rm -f "$temp_script"

        pause
        return
    fi

    chmod 700 "$temp_script"

    printf '\n'

    printf '  %b✓ VALIDATED%b\n' \
        "$BRIGHT_GREEN$BOLD" \
        "$RESET"

    printf '  %bLaunching %s...%b\n\n' \
        "$BRIGHT_CYAN" \
        "$name" \
        "$RESET"

    sleep 0.4

    bash "$temp_script"

    local exit_code=$?

    rm -f "$temp_script"

    printf '\n'

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$GRAY" \
        "$RESET"

    printf '\n'

    if [ "$exit_code" -eq 0 ]; then

        printf '  %b● COMPLETE%b\n' \
            "$BRIGHT_GREEN$BOLD" \
            "$RESET"

        printf '  %b%s finished successfully.%b\n' \
            "$GRAY" \
            "$name" \
            "$RESET"

    else

        printf '  %b● FAILED%b\n' \
            "$BRIGHT_RED$BOLD" \
            "$RESET"

        printf '  %b%s returned exit code %s.%b\n' \
            "$GRAY" \
            "$name" \
            "$exit_code" \
            "$RESET"
    fi

    pause
}

# -----------------------------------------------------------------------------
# MODULE LINE
# -----------------------------------------------------------------------------

module_line() {

    local id="$1"
    local color="$2"

    printf '  %b%02d%b  %b%-30s%b  %b%s%b\n' \
        "$color" \
        "$id" \
        "$RESET" \
        "$WHITE" \
        "${MODULE_NAME[$id]}" \
        "$RESET" \
        "$GRAY" \
        "${MODULE_DESCRIPTION[$id]}" \
        "$RESET"
}

# -----------------------------------------------------------------------------
# MENU HEADER
# -----------------------------------------------------------------------------

menu_section() {

    local title="$1"
    local color="$2"

    printf '\n'

    printf '  %b%s%b\n' \
        "$color$BOLD" \
        "$title" \
        "$RESET"

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$color" \
        "$RESET"

    printf '\n'
}

# -----------------------------------------------------------------------------
# FULL MODULE MENU
# -----------------------------------------------------------------------------

show_menu() {

    draw_header

    printf '\n'

    printf '  %bWORKSPACE%b\n' \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  %bChoose a module to launch%b\n' \
        "$GRAY" \
        "$RESET"

    menu_section "PANELS" "$BRIGHT_CYAN"

    module_line 1 "$BRIGHT_CYAN"
    module_line 2 "$BRIGHT_CYAN"
    module_line 3 "$BRIGHT_CYAN"
    module_line 4 "$BRIGHT_CYAN"
    module_line 5 "$BRIGHT_CYAN"
    module_line 6 "$BRIGHT_CYAN"
    module_line 7 "$BRIGHT_CYAN"
    module_line 8 "$BRIGHT_CYAN"
    module_line 9 "$BRIGHT_CYAN"
    module_line 10 "$BRIGHT_CYAN"

    menu_section "SERVER TOOLS" "$BRIGHT_GREEN"

    module_line 11 "$BRIGHT_GREEN"
    module_line 12 "$BRIGHT_GREEN"
    module_line 13 "$BRIGHT_GREEN"
    module_line 14 "$BRIGHT_GREEN"
    module_line 15 "$BRIGHT_GREEN"
    module_line 16 "$BRIGHT_GREEN"
    module_line 17 "$BRIGHT_GREEN"
    module_line 18 "$BRIGHT_GREEN"
    module_line 19 "$BRIGHT_GREEN"

    menu_section "PTERODACTYL" "$BRIGHT_MAGENTA"

    module_line 20 "$BRIGHT_MAGENTA"
    module_line 21 "$BRIGHT_MAGENTA"
    module_line 22 "$BRIGHT_MAGENTA"
    module_line 23 "$BRIGHT_MAGENTA"
    module_line 24 "$BRIGHT_MAGENTA"
    module_line 26 "$BRIGHT_MAGENTA"
    module_line 28 "$BRIGHT_MAGENTA"
    module_line 31 "$BRIGHT_MAGENTA"

    menu_section "NETWORK / SERVER" "$BRIGHT_YELLOW"

    module_line 25 "$BRIGHT_YELLOW"
    module_line 27 "$BRIGHT_YELLOW"
    module_line 29 "$BRIGHT_YELLOW"
    module_line 30 "$BRIGHT_YELLOW"

    menu_section "VPS" "$BRIGHT_BLUE"

    module_line 32 "$BRIGHT_BLUE"
    module_line 33 "$BRIGHT_BLUE"

    printf '\n'

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$GRAY" \
        "$RESET"

    printf '\n'

    printf '  %b[ C ]%b  Cloudflare Settings\n' \
        "$BRIGHT_CYAN$BOLD" \
        "$RESET"

    printf '  %b[ I ]%b  System Information\n' \
        "$BRIGHT_BLUE$BOLD" \
        "$RESET"

    printf '  %b[ R ]%b  Refresh\n' \
        "$BRIGHT_GREEN$BOLD" \
        "$RESET"

    printf '  %b[ Q ]%b  Exit\n' \
        "$BRIGHT_RED$BOLD" \
        "$RESET"

    printf '\n'

    printf '  %bPARA%b %b>%b ' \
        "$BRIGHT_CYAN$BOLD" \
        "$RESET" \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"
}

# -----------------------------------------------------------------------------
# CLOUDFARE SETTINGS
# -----------------------------------------------------------------------------

cloudflare_settings() {

    clear_screen

    printf '\n'

    printf '  %bCLOUDFLARE%b %b// SETTINGS%b\n' \
        "$BRIGHT_MAGENTA$BOLD" \
        "$RESET" \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$BRIGHT_MAGENTA" \
        "$RESET"

    printf '\n'

    printf '  %bPANEL%b\n\n' \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  %bTYPE%b       %bHTTPS%b\n' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_GREEN" \
        "$RESET"

    printf '  %bSERVICE%b    %blocalhost%b\n' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_CYAN" \
        "$RESET"

    printf '\n'

    printf '  %bNODE%b\n\n' \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  %bTYPE%b       %bHTTPS%b\n' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_GREEN" \
        "$RESET"

    printf '  %bSERVICE%b    %blocalhost:8080%b\n' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_CYAN" \
        "$RESET"

    printf '\n'

    printf '  %bSTATUS%b     %b● READY%b\n' \
        "$GRAY" \
        "$RESET" \
        "$BRIGHT_GREEN$BOLD" \
        "$RESET"

    pause
}

# -----------------------------------------------------------------------------
# SYSTEM INFORMATION
# -----------------------------------------------------------------------------

system_info() {

    clear_screen

    printf '\n'

    printf '  %bSYSTEM%b %b// TELEMETRY%b\n' \
        "$BRIGHT_BLUE$BOLD" \
        "$RESET" \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  %b────────────────────────────────────────────────────────────────────%b\n' \
        "$BRIGHT_BLUE" \
        "$RESET"

    printf '\n'

    printf '  %bHOST%b\n\n' \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  Hostname       %b%s%b\n' \
        "$BRIGHT_CYAN" \
        "$(get_hostname)" \
        "$RESET"

    printf '  User           %b%s%b\n' \
        "$BRIGHT_CYAN" \
        "$(whoami)" \
        "$RESET"

    printf '  Directory      %b%s%b\n' \
        "$BRIGHT_CYAN" \
        "$PWD" \
        "$RESET"

    printf '  System         %b%s%b\n' \
        "$BRIGHT_CYAN" \
        "$(uname -srm)" \
        "$RESET"

    printf '  Uptime         %b%s%b\n' \
        "$BRIGHT_CYAN" \
        "$(get_uptime)" \
        "$RESET"

    printf '\n'

    printf '  %bRESOURCES%b\n\n' \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  CPU            %b%s%%%b\n' \
        "$BRIGHT_GREEN" \
        "$(get_cpu)" \
        "$RESET"

    printf '  Memory         %b%s%b\n' \
        "$BRIGHT_MAGENTA" \
        "$(free -h 2>/dev/null | awk '/Mem:/ {print $3 "/" $2}')" \
        "$RESET"

    printf '  Disk           %b%s%b\n' \
        "$BRIGHT_YELLOW" \
        "$(df -h / 2>/dev/null | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')" \
        "$RESET"

    printf '\n'

    printf '  %bMODULE REGISTRY%b\n\n' \
        "$BRIGHT_WHITE$BOLD" \
        "$RESET"

    printf '  Registered modules    %b%s%b\n' \
        "$BRIGHT_CYAN" \
        "$MODULE_COUNT" \
        "$RESET"

    printf '  Remote source         %bGitHub%b\n' \
        "$BRIGHT_CYAN" \
        "$RESET"

    printf '  Runtime               %bBash%b\n' \
        "$BRIGHT_CYAN" \
        "$RESET"

    pause
}

# -----------------------------------------------------------------------------
# EXIT
# -----------------------------------------------------------------------------

exit_console() {

    clear_screen

    printf '\n\n'

    printf '  %b' "$BRIGHT_CYAN$BOLD"

    typewrite "Closing PARA workspace..." 0.025

    printf '%b\n' "$RESET"

    sleep 0.4

    printf '\n'

    printf '  %b● SESSION CLOSED%b\n' \
        "$BRIGHT_GREEN$BOLD" \
        "$RESET"

    printf '  %bCredits: Para%b\n\n' \
        "$GRAY" \
        "$RESET"

    exit 0
}

# -----------------------------------------------------------------------------
# MAIN
# -----------------------------------------------------------------------------

main() {

    hide_cursor

    boot_screen

    while true; do

        show_menu

        read -r choice

        case "$choice" in

            # -----------------------------------------------------------------
            # ALL MODULES
            # -----------------------------------------------------------------

            1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33)

                run_module "$choice"

                ;;

            # -----------------------------------------------------------------
            # SPECIAL
            # -----------------------------------------------------------------

            c|C)

                cloudflare_settings

                ;;

            i|I)

                system_info

                ;;

            r|R)

                spinner "refreshing workspace" 15

                ;;

            q|Q|0|exit|quit)

                exit_console

                ;;

            *)

                printf '\n'

                printf '  %bUnknown command.%b\n' \
                    "$BRIGHT_RED$BOLD" \
                    "$RESET"

                sleep 0.7

                ;;
        esac

    done
}

# -----------------------------------------------------------------------------
# START
# -----------------------------------------------------------------------------

main
