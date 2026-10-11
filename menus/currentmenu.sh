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
MODULE_URL[1]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/PterodactylHub"
MODULE_CATEGORY[1]="PANELS"
MODULE_DESCRIPTION[1]="Pterodactyl management hub"

MODULE_NAME[2]="Reviactyl Panel"
MODULE_URL[2]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/Reviactyl_Installer.sh"
MODULE_CATEGORY[2]="PANELS"
MODULE_DESCRIPTION[2]="Reviactyl panel installer"

MODULE_NAME[3]="Jexcatyl Panel"
MODULE_URL[3]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/Jexcatylnstall"
MODULE_CATEGORY[3]="PANELS"
MODULE_DESCRIPTION[3]="Jexcatyl panel installer"

MODULE_NAME[4]="Mythical Dash"
MODULE_URL[4]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/MythicalDash"
MODULE_CATEGORY[4]="PANELS"
MODULE_DESCRIPTION[4]="MythicalDash client area installer"

MODULE_NAME[5]="Cockpit"
MODULE_URL[5]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/system-tools/CockpitInstall"
MODULE_CATEGORY[5]="MISC"
MODULE_DESCRIPTION[5]="Cockpit server administration"

MODULE_NAME[6]="WHMCS"
MODULE_URL[6]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/WHMCS"
MODULE_CATEGORY[6]="PANELS"
MODULE_DESCRIPTION[6]="WHMCS hosting management"

MODULE_NAME[7]="Convoy"
MODULE_URL[7]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/convoy"
MODULE_CATEGORY[7]="PANELS"
MODULE_DESCRIPTION[7]="Convoy deployment module"

MODULE_NAME[8]="XRDP"
MODULE_URL[8]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/remote-access/xrdp"
MODULE_CATEGORY[8]="REMOTE ACCESS"
MODULE_DESCRIPTION[8]="Remote desktop installer"

MODULE_NAME[9]="Paymenter"
MODULE_URL[9]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/paymenter"
MODULE_CATEGORY[9]="PANELS"
MODULE_DESCRIPTION[9]="Paymenter billing deployment"

MODULE_NAME[10]="HVM V8"
MODULE_URL[10]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/hvmv8"
MODULE_CATEGORY[10]="PANELS"
MODULE_DESCRIPTION[10]="HVM V8 deployment module"

# =============================================================================
# ORIGINAL SERVER TOOLS
# =============================================================================

MODULE_NAME[11]="Auto Root"
MODULE_URL[11]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/networking/sshfix"
MODULE_CATEGORY[11]="NETWORKING"
MODULE_DESCRIPTION[11]="SSH and root configuration"

MODULE_NAME[12]="Cloudflare Installer"
MODULE_URL[12]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/networking/CloudflareMenu"
MODULE_CATEGORY[12]="NETWORKING"
MODULE_DESCRIPTION[12]="Cloudflare management utility"

MODULE_NAME[13]="Docker VM"
MODULE_URL[13]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/virtualization/dockercontainer"
MODULE_CATEGORY[13]="VIRTUALIZATION"
MODULE_DESCRIPTION[13]="Docker container management"

MODULE_NAME[14]="Local SSL Generator"
MODULE_URL[14]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/customization/SSL%20GENRATOR"
MODULE_CATEGORY[14]="CUSTOMIZATION"
MODULE_DESCRIPTION[14]="Local SSL certificate generator"

MODULE_NAME[15]="Swap RAM"
MODULE_URL[15]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/system-tools/SwapRam"
MODULE_CATEGORY[15]="SERVER TOOLS"
MODULE_DESCRIPTION[15]="Swap memory management"

MODULE_NAME[16]="Nginx Reload"
MODULE_URL[16]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/networking/NginxReload"
MODULE_CATEGORY[16]="NETWORKING"
MODULE_DESCRIPTION[16]="Reload Nginx service"

MODULE_NAME[17]="Blueprint Installer"
MODULE_URL[17]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/system-tools/BlueprintFix"
MODULE_CATEGORY[17]="SERVER TOOLS"
MODULE_DESCRIPTION[17]="Blueprint installation utility"

MODULE_NAME[18]="VPS Menu"
MODULE_URL[18]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/menus/VpsMenu"
MODULE_CATEGORY[18]="VPS"
MODULE_DESCRIPTION[18]="VPS management toolkit"

MODULE_NAME[19]="Custom MOTD Builder"
MODULE_URL[19]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/customization/customotdbuilder"
MODULE_CATEGORY[19]="CUSTOMIZATION"
MODULE_DESCRIPTION[19]="Custom terminal MOTD builder"

# =============================================================================
# PTERODACTYL / NETWORKING / VPS
# =============================================================================

MODULE_NAME[20]="Pterodactyl Panel Installer"
MODULE_URL[20]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/pteroinstall"
MODULE_CATEGORY[20]="PTERODACTYL"
MODULE_DESCRIPTION[20]="Install Pterodactyl Panel"

MODULE_NAME[21]="Pterodactyl Wings"
MODULE_URL[21]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/wingsptero"
MODULE_CATEGORY[21]="PTERODACTYL"
MODULE_DESCRIPTION[21]="Install Pterodactyl Wings"

MODULE_NAME[22]="Pterodactyl Update"
MODULE_URL[22]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/updateptero"
MODULE_CATEGORY[22]="PTERODACTYL"
MODULE_DESCRIPTION[22]="Update Pterodactyl"

MODULE_NAME[23]="Pterodactyl Uninstall"
MODULE_URL[23]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/uninstallptero"
MODULE_CATEGORY[23]="PTERODACTYL"
MODULE_DESCRIPTION[23]="Uninstall Pterodactyl"

MODULE_NAME[24]="Blueprint ParaCom"
MODULE_URL[24]="https://raw.githubusercontent.com/ParaNoob123/Blueprint/refs/heads/main/paracom"
MODULE_CATEGORY[24]="PTERODACTYL"
MODULE_DESCRIPTION[24]="ParaNoob Blueprint installer"

MODULE_NAME[25]="Cloudflare Legacy Installer"
MODULE_URL[25]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/networking/cloudflareinstall"
MODULE_CATEGORY[25]="NETWORKING"
MODULE_DESCRIPTION[25]="Legacy Cloudflare installer"

MODULE_NAME[26]="Theme Installer"
MODULE_URL[26]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/customization/thememenu"
MODULE_CATEGORY[26]="PTERODACTYL"
MODULE_DESCRIPTION[26]="Pterodactyl theme manager"

MODULE_NAME[27]="Playit Setup"
MODULE_URL[27]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/networking/playit"
MODULE_CATEGORY[27]="NETWORKING"
MODULE_DESCRIPTION[27]="Playit networking setup"

MODULE_NAME[28]="Pterodactyl Bot"
MODULE_URL[28]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/bots/PteroBot"
MODULE_CATEGORY[28]="PTERODACTYL"
MODULE_DESCRIPTION[28]="Pterodactyl bot manager"

MODULE_NAME[29]="Backup Manager"
MODULE_URL[29]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/system-tools/BackUp"
MODULE_CATEGORY[29]="SERVER TOOLS"
MODULE_DESCRIPTION[29]="Server backup manager"

MODULE_NAME[30]="Nginx Reload Legacy"
MODULE_URL[30]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/networking/NginxReload"
MODULE_CATEGORY[30]="NETWORKING"
MODULE_DESCRIPTION[30]="Legacy Nginx reload module"

MODULE_NAME[31]="Pterodactyl Restart"
MODULE_URL[31]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/panels/RestartPtero"
MODULE_CATEGORY[31]="PTERODACTYL"
MODULE_DESCRIPTION[31]="Restart Pterodactyl services"

MODULE_NAME[32]="VPS Maker"
MODULE_URL[32]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/menus/VpsMaker"
MODULE_CATEGORY[32]="VIRTUALIZATION"
MODULE_DESCRIPTION[32]="VPS creation utility"

MODULE_NAME[34]="Fastfetch Installer"
MODULE_URL[34]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/system-tools/fastfetchinstaller"
MODULE_CATEGORY[34]="SERVER TOOLS"
MODULE_DESCRIPTION[34]="Install Fastfetch system information tool"

MODULE_NAME[35]="Tailscale"
MODULE_URL[35]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/networking/tailscale"
MODULE_CATEGORY[35]="NETWORKING"
MODULE_DESCRIPTION[35]="Install and configure Tailscale networking"

MODULE_NAME[36]="RDP"
MODULE_URL[36]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/remote-access/rdp"
MODULE_CATEGORY[36]="REMOTE ACCESS"
MODULE_DESCRIPTION[36]="Remote desktop access setup"

MODULE_NAME[37]="LXC Installer"
MODULE_URL[37]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/virtualization/lxcinstall"
MODULE_CATEGORY[37]="VIRTUALIZATION"
MODULE_DESCRIPTION[37]="Install and configure LXC containers"

# Fixed duplicate ID: Proxmox is 33
MODULE_NAME[33]="Proxmox Installer Debian 13"
MODULE_URL[33]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/virtualization/proxmoxinstallerdebain13"
MODULE_CATEGORY[33]="VIRTUALIZATION"
MODULE_DESCRIPTION[33]="Proxmox Installer in Debian 13"

MODULE_NAME[38]="Proxmox Menu"
MODULE_URL[38]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/virtualization/proxmoxmenu"
MODULE_CATEGORY[38]="VIRTUALIZATION"
MODULE_DESCRIPTION[38]="Open Proxmox installer menu for Debian 12 / Debian 13"

MODULE_COUNT=38

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
    typewrite "38 modules / category submenus / server operations" 0.012
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

show_category_menu() {
    while true; do
        draw_header
        printf '\n'
        printf '  %bWORKSPACE / CATEGORY DASHBOARD%b\n' "$BRIGHT_WHITE$BOLD" "$RESET"
        printf '  %bChoose a category to open its submenu%b\n' "$GRAY" "$RESET"
        menu_section "DEPLOYMENT & MANAGEMENT" "$BRIGHT_CYAN"
        printf '  %b[ 1 ]%b  PANELS\n' "$BRIGHT_CYAN$BOLD" "$RESET"
        printf '  %b[ 2 ]%b  PTERODACTYL\n' "$BRIGHT_MAGENTA$BOLD" "$RESET"
        printf '  %b[ 3 ]%b  SERVER TOOLS\n' "$BRIGHT_GREEN$BOLD" "$RESET"
        printf '  %b[ 4 ]%b  NETWORKING\n' "$BRIGHT_YELLOW$BOLD" "$RESET"
        printf '  %b[ 5 ]%b  REMOTE ACCESS\n' "$BRIGHT_MAGENTA$BOLD" "$RESET"
        printf '  %b[ 6 ]%b  VIRTUALIZATION\n' "$BRIGHT_BLUE$BOLD" "$RESET"
        printf '  %b[ 7 ]%b  CUSTOMIZATION\n' "$BRIGHT_CYAN$BOLD" "$RESET"
        printf '  %b[ 8 ]%b  VPS\n' "$BRIGHT_GREEN$BOLD" "$RESET"
        printf '  %b[ 9 ]%b  MISC\n' "$BRIGHT_WHITE$BOLD" "$RESET"
        printf '\n'
        printf '  %b[ C ]%b  Cloudflare Settings\n' "$BRIGHT_CYAN$BOLD" "$RESET"
        printf '  %b[ I ]%b  System Information\n' "$BRIGHT_BLUE$BOLD" "$RESET"
        printf '  %b[ R ]%b  Refresh\n' "$BRIGHT_GREEN$BOLD" "$RESET"
        printf '  %b[ Q ]%b  Exit\n' "$BRIGHT_RED$BOLD" "$RESET"
        printf '\n  %bPARA >%b ' "$BRIGHT_CYAN$BOLD" "$RESET"
        read -r choice
        case "$choice" in
            1) show_category "PANELS" "$BRIGHT_CYAN" ;;
            2) show_category "PTERODACTYL" "$BRIGHT_MAGENTA" ;;
            3) show_category "SERVER TOOLS" "$BRIGHT_GREEN" ;;
            4) show_category "NETWORKING" "$BRIGHT_YELLOW" ;;
            5) show_category "REMOTE ACCESS" "$BRIGHT_MAGENTA" ;;
            6) show_category "VIRTUALIZATION" "$BRIGHT_BLUE" ;;
            7) show_category "CUSTOMIZATION" "$BRIGHT_CYAN" ;;
            8) show_category "VPS" "$BRIGHT_GREEN" ;;
            9) show_category "MISC" "$BRIGHT_WHITE" ;;
            c|C) cloudflare_settings ;;
            i|I) system_info ;;
            r|R) spinner "refreshing workspace" 15 ;;
            q|Q|0|exit|quit) exit_console ;;
            *) printf '\n  %bUnknown category.%b\n' "$BRIGHT_RED$BOLD" "$RESET"; sleep 0.7 ;;
        esac
    done
}

show_category() {
    local category="$1"
    local color="$2"
    local id choice found=0
    while true; do
        draw_header
        printf '\n  %bCATEGORY%b  %b%s%b\n' "$GRAY$BOLD" "$RESET" "$color$BOLD" "$category" "$RESET"
        printf '  %bSelect a module number, or B to go back%b\n' "$GRAY" "$RESET"
        menu_section "$category MODULES" "$color"
        # Proxmox Menu is pinned first in the Virtualization submenu.
        if [[ "$category" == "VIRTUALIZATION" ]]; then
            module_line 38 "$color"
            found=1
        fi

        for id in $(printf '%s\\n' "${!MODULE_NAME[@]}" | sort -n); do
            if [[ "${MODULE_CATEGORY[$id]}" == "$category" && "$id" != "38" ]]; then
                module_line "$id" "$color"
                found=1
            fi
        done
        if [[ "$found" -eq 0 ]]; then
            printf '  %bNo modules registered in this category yet.%b\n' "$BRIGHT_YELLOW" "$RESET"
        fi
        printf '\n  %b[ B ]%b Back to categories    %b[ Q ]%b Exit\n' "$BRIGHT_CYAN$BOLD" "$RESET" "$BRIGHT_RED$BOLD" "$RESET"
        printf '\n  %bPARA / %s >%b ' "$BRIGHT_CYAN$BOLD" "$category" "$RESET"
        read -r choice
        case "$choice" in
            b|B|back) return ;;
            q|Q|exit|quit|0) exit_console ;;
            *)
                if [[ "$choice" =~ ^[0-9]+$ ]] && [[ -n "${MODULE_NAME[$choice]:-}" ]] && [[ "${MODULE_CATEGORY[$choice]}" == "$category" ]]; then
                    run_module "$choice"
                else
                    printf '\n  %bInvalid option for this category.%b\n' "$BRIGHT_RED$BOLD" "$RESET"
                    sleep 0.7
                fi
                ;;
        esac
    done
}

show_menu() {
    show_category_menu
}

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
        show_category_menu
    done
}

# -----------------------------------------------------------------------------
# START
# -----------------------------------------------------------------------------

main
