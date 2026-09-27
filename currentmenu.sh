```bash
#!/usr/bin/env bash
# ==============================================================
# PARA CONTROL CENTER
# Infrastructure & Panel Management Suite
# Full Multi-Level Menu Edition
#
# Credits: Para
# ==============================================================

set -u

# ──────────────────────────────────────────────────────────────
# COLOR SYSTEM
# ──────────────────────────────────────────────────────────────

RESET='\033[0m'
BOLD='\033[1m'

WHITE='\033[38;5;255m'
GRAY='\033[38;5;245m'
DARK='\033[38;5;240m'

RED='\033[38;5;196m'
ORANGE='\033[38;5;208m'
YELLOW='\033[38;5;220m'
GREEN='\033[38;5;82m'
LIME='\033[38;5;118m'

CYAN='\033[38;5;51m'
BLUE='\033[38;5;39m'
PURPLE='\033[38;5;141m'
MAGENTA='\033[38;5;201m'
VIOLET='\033[38;5;135m'

# ──────────────────────────────────────────────────────────────
# PANEL MODULES
# ──────────────────────────────────────────────────────────────

declare -A PANEL_URLS=(

    [1]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/PterodactylHub"

    [2]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/Reviactyl_Installer.sh"

    [3]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/Jexcatylnstall"

    [4]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/MythicalDash"

    [5]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/CockpitInstall"

    [6]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/whmcs"

    [7]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/convoy"

    [8]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/xrdp"

    [9]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/paymenter"

    [10]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/hvmv8"
)

declare -A PANEL_NAMES=(

    [1]="Pterodactyl Hub"
    [2]="Reviactyl Panel"
    [3]="Jexcatyl Panel"
    [4]="Mythical Dash"
    [5]="Cockpit"
    [6]="WHMCS"
    [7]="Convoy"
    [8]="XRDP"
    [9]="Paymenter"
    [10]="HVM V8"
)

# ──────────────────────────────────────────────────────────────
# SYSTEM TOOL MODULES
# ──────────────────────────────────────────────────────────────

declare -A TOOL_URLS=(

    [1]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/sshfix"

    [2]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/CloudflareMenu"

    [3]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/dockercontainer"

    [4]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/SSL%20GENRATOR"

    [5]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/SwapRam"

    [6]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/NginxReload"

    [7]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/BlueprintFix"

    [8]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/VpsMenu"

    [9]="https://raw.githubusercontent.com/ItsMePara123/GG/refs/heads/main/customotdbuilder"
)

declare -A TOOL_NAMES=(

    [1]="Auto Root"
    [2]="Cloudflare Installer"
    [3]="Docker VM"
    [4]="Local SSL Generator"
    [5]="Swap RAM"
    [6]="Nginx Reload"
    [7]="Blueprint Installer"
    [8]="VPS Menu"
    [9]="Custom MOTD Builder"
)

# ──────────────────────────────────────────────────────────────
# SYSTEM TELEMETRY
# ──────────────────────────────────────────────────────────────

get_system_info() {

    HOSTNAME_NOW="$(hostname 2>/dev/null || echo "Unknown")"

    CPU_NOW="$(
        top -bn1 2>/dev/null |
        awk '/Cpu\(s\)/ {
            gsub(",", ".", $2)
            gsub(",", ".", $4)
            printf "%.0f", $2 + $4
            exit
        }'
    )"

    [[ -z "$CPU_NOW" ]] && CPU_NOW="--"

    RAM_NOW="$(
        free 2>/dev/null |
        awk '/^Mem:/ {
            if ($2 > 0)
                printf "%.0f", ($3 / $2) * 100
            else
                print "--"
        }'
    )"

    [[ -z "$RAM_NOW" ]] && RAM_NOW="--"

    DISK_NOW="$(
        df -h / 2>/dev/null |
        awk 'NR==2 {print $5}'
    )"

    [[ -z "$DISK_NOW" ]] && DISK_NOW="--"

    UPTIME_NOW="$(
        uptime -p 2>/dev/null |
        sed 's/^up //'
    )"

    [[ -z "$UPTIME_NOW" ]] && UPTIME_NOW="Unknown"
}

# ──────────────────────────────────────────────────────────────
# VISUAL HELPERS
# ──────────────────────────────────────────────────────────────

line() {
    printf '%b\n' "${DARK}──────────────────────────────────────────────────────────────────────────────${RESET}"
}

heavy_line() {
    printf '%b\n' "${PURPLE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}"
}

pause_menu() {
    echo
    printf '%b' "${GRAY}Press ENTER to continue...${RESET}"
    read -r
}

# ──────────────────────────────────────────────────────────────
# MAIN BRAND HEADER
# ──────────────────────────────────────────────────────────────

header() {

    clear

    printf '%b\n' "${CYAN}${BOLD}"

    cat <<'EOF'
██████╗  █████╗ ██████╗  █████╗
██╔══██╗██╔══██╗██╔══██╗██╔══██╗
██████╔╝███████║██████╔╝███████║
██╔═══╝ ██╔══██║██╔══██╗██╔══██║
██║     ██║  ██║██║  ██║██║  ██║
╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝
EOF

    printf '%b\n' "${RESET}"

    printf '%b\n' "${PURPLE}╭──────────────────────────────────────────────────────────────────────────────╮${RESET}"
    printf '%b\n' "${PURPLE}│${RESET} ${WHITE}${BOLD}PARA CONTROL CENTER${RESET} ${GRAY}•${RESET} ${MAGENTA}SERVER MANAGEMENT SUITE${RESET}           ${PURPLE}│${RESET}"
    printf '%b\n' "${PURPLE}│${RESET} ${GRAY}Panels • Deployment • Security • Utilities${RESET}                         ${PURPLE}│${RESET}"
    printf '%b\n' "${PURPLE}╰──────────────────────────────────────────────────────────────────────────────╯${RESET}"

    echo
}

# ──────────────────────────────────────────────────────────────
# STATUS BAR
# ──────────────────────────────────────────────────────────────

status_bar() {

    get_system_info

    printf '%b\n' "${BLUE}${BOLD} SYSTEM STATUS${RESET}"
    line

    printf " ${CYAN}●${RESET} ${GRAY}HOST${RESET} ${WHITE}%-18s${RESET}" "$HOSTNAME_NOW"
    printf " ${GREEN}●${RESET} ${GRAY}CPU${RESET} ${YELLOW}%3s%%${RESET}" "$CPU_NOW"
    printf " ${MAGENTA}●${RESET} ${GRAY}RAM${RESET} ${PURPLE}%3s%%${RESET}" "$RAM_NOW"
    printf " ${ORANGE}●${RESET} ${GRAY}DISK${RESET} ${CYAN}%5s${RESET}\n" "$DISK_NOW"

    printf " ${BLUE}●${RESET} ${GRAY}UPTIME${RESET} ${WHITE}%s${RESET}\n" "$UPTIME_NOW"

    line
    echo
}

# ──────────────────────────────────────────────────────────────
# REMOTE SCRIPT EXECUTOR
# ──────────────────────────────────────────────────────────────

run_remote() {

    local title="$1"
    local url="$2"

    if ! command -v curl >/dev/null 2>&1; then

        printf '\n%b\n' "${RED}✖ curl is not installed.${RESET}"
        pause_menu
        return
    fi

    local temp_file
    temp_file="$(mktemp -t para-module-XXXXXX)"

    echo
    printf '%b\n' "${CYAN}${BOLD}LAUNCHING: ${WHITE}${title}${RESET}"
    line

    printf " ${GRAY}Connecting to module...${RESET} "

    if curl \
        --fail \
        --silent \
        --show-error \
        --location \
        --connect-timeout 15 \
        --max-time 120 \
        --output "$temp_file" \
        "$url"; then

        printf '%b\n' "${GREEN}CONNECTED${RESET}"

    else

        printf '%b\n' "${RED}FAILED${RESET}"
        rm -f "$temp_file"
        pause_menu
        return
    fi

    if [[ ! -s "$temp_file" ]]; then

        printf '%b\n' "${RED}✖ Remote module returned an empty response.${RESET}"
        rm -f "$temp_file"
        pause_menu
        return
    fi

    chmod 700 "$temp_file"

    printf " ${GRAY}Module:${RESET} ${WHITE}%s${RESET}\n" "$title"
    printf " ${GRAY}Status:${RESET} ${GREEN}READY${RESET}\n"

    line

    bash "$temp_file"
    local exit_code=$?

    rm -f "$temp_file"

    echo

    if [[ "$exit_code" -eq 0 ]]; then
        printf '%b\n' "${GREEN}✔ ${title} completed successfully.${RESET}"
    else
        printf '%b\n' "${RED}✖ ${title} exited with code ${exit_code}.${RESET}"
    fi

    pause_menu
}

# ──────────────────────────────────────────────────────────────
# PANELS SUBMENU
# ──────────────────────────────────────────────────────────────

panels_menu() {

    while true; do

        header

        printf '%b\n' "${MAGENTA}${BOLD} PANEL DEPLOYMENT CENTER${RESET}"
        printf '%b\n' "${GRAY}Install and manage supported hosting panels and dashboards.${RESET}"
        echo

        line

        printf '%b\n' "${CYAN}${BOLD} AVAILABLE PANELS${RESET}"
        echo

        printf " ${CYAN}[01]${RESET} ${WHITE}${BOLD}Pterodactyl Hub${RESET}       ${GRAY}Pterodactyl management hub${RESET}\n"
        printf " ${PURPLE}[02]${RESET} ${WHITE}${BOLD}Reviactyl Panel${RESET}       ${GRAY}Reviactyl installer${RESET}\n"
        printf " ${BLUE}[03]${RESET} ${WHITE}${BOLD}Jexcatyl Panel${RESET}        ${GRAY}Jexcatyl installer${RESET}\n"
        printf " ${MAGENTA}[04]${RESET} ${WHITE}${BOLD}Mythical Dash${RESET}         ${GRAY}Mythical dashboard${RESET}\n"
        printf " ${GREEN}[05]${RESET} ${WHITE}${BOLD}Cockpit${RESET}               ${GRAY}Cockpit installation${RESET}\n"
        printf " ${YELLOW}[06]${RESET} ${WHITE}${BOLD}WHMCS${RESET}                 ${GRAY}WHMCS deployment${RESET}\n"
        printf " ${ORANGE}[07]${RESET} ${WHITE}${BOLD}Convoy${RESET}                ${GRAY}Convoy installation${RESET}\n"
        printf " ${CYAN}[08]${RESET} ${WHITE}${BOLD}XRDP${RESET}                  ${GRAY}Remote desktop setup${RESET}\n"
        printf " ${PURPLE}[09]${RESET} ${WHITE}${BOLD}Paymenter${RESET}             ${GRAY}Paymenter deployment${RESET}\n"
        printf " ${RED}[10]${RESET} ${WHITE}${BOLD}HVM V8${RESET}                ${GRAY}HVM V8 installer${RESET}\n"

        echo
        line

        printf " ${RED}[0]${RESET} ${GRAY}← Return to main menu${RESET}\n"

        echo
        printf '%b' "${CYAN}${BOLD} PANELS › ${RESET}"

        read -r panel_choice

        case "$panel_choice" in

            1|01)
                run_remote "${PANEL_NAMES[1]}" "${PANEL_URLS[1]}"
                ;;

            2|02)
                run_remote "${PANEL_NAMES[2]}" "${PANEL_URLS[2]}"
                ;;

            3|03)
                run_remote "${PANEL_NAMES[3]}" "${PANEL_URLS[3]}"
                ;;

            4|04)
                run_remote "${PANEL_NAMES[4]}" "${PANEL_URLS[4]}"
                ;;

            5|05)
                run_remote "${PANEL_NAMES[5]}" "${PANEL_URLS[5]}"
                ;;

            6|06)
                run_remote "${PANEL_NAMES[6]}" "${PANEL_URLS[6]}"
                ;;

            7|07)
                run_remote "${PANEL_NAMES[7]}" "${PANEL_URLS[7]}"
                ;;

            8|08)
                run_remote "${PANEL_NAMES[8]}" "${PANEL_URLS[8]}"
                ;;

            9|09)
                run_remote "${PANEL_NAMES[9]}" "${PANEL_URLS[9]}"
                ;;

            10)
                run_remote "${PANEL_NAMES[10]}" "${PANEL_URLS[10]}"
                ;;

            0|back|b)
                return
                ;;

            *)
                printf '\n%b\n' "${RED}✖ Invalid panel selection.${RESET}"
                sleep 1
                ;;
        esac
    done
}

# ──────────────────────────────────────────────────────────────
# MAIN UTILITIES MENU
# ──────────────────────────────────────────────────────────────

tools_menu() {

    while true; do

        header

        printf '%b\n' "${BLUE}${BOLD} SERVER UTILITIES${RESET}"
        printf '%b\n' "${GRAY}System administration, networking and server tools.${RESET}"
        echo

        line

        printf '%b\n' "${CYAN}${BOLD} UTILITY MODULES${RESET}"
        echo

        printf " ${GREEN}[01]${RESET} ${WHITE}${BOLD}Auto Root${RESET}             ${GRAY}SSH / root configuration${RESET}\n"
        printf " ${ORANGE}[02]${RESET} ${WHITE}${BOLD}Cloudflare Installer${RESET}  ${GRAY}Cloudflare deployment${RESET}\n"
        printf " ${CYAN}[03]${RESET} ${WHITE}${BOLD}Docker VM${RESET}             ${GRAY}Docker container tools${RESET}\n"
        printf " ${PURPLE}[04]${RESET} ${WHITE}${BOLD}Local SSL Generator${RESET}   ${GRAY}Local certificate utility${RESET}\n"
        printf " ${YELLOW}[05]${RESET} ${WHITE}${BOLD}Swap RAM${RESET}              ${GRAY}Swap memory management${RESET}\n"
        printf " ${BLUE}[06]${RESET} ${WHITE}${BOLD}Nginx Reload${RESET}          ${GRAY}Nginx reload utility${RESET}\n"
        printf " ${MAGENTA}[07]${RESET} ${WHITE}${BOLD}Blueprint Installer${RESET}   ${GRAY}Pterodactyl Blueprint tool${RESET}\n"
        printf " ${GREEN}[08]${RESET} ${WHITE}${BOLD}VPS Menu${RESET}              ${GRAY}VPS management tools${RESET}\n"
        printf " ${CYAN}[09]${RESET} ${WHITE}${BOLD}Custom MOTD Builder${RESET}   ${GRAY}Terminal MOTD generator${RESET}\n"

        echo
        line

        printf " ${RED}[0]${RESET} ${GRAY}← Return to main menu${RESET}\n"

        echo
        printf '%b' "${BLUE}${BOLD} TOOLS › ${RESET}"

        read -r tool_choice

        case "$tool_choice" in

            1|01)
                run_remote "${TOOL_NAMES[1]}" "${TOOL_URLS[1]}"
                ;;

            2|02)
                run_remote "${TOOL_NAMES[2]}" "${TOOL_URLS[2]}"
                ;;

            3|03)
                run_remote "${TOOL_NAMES[3]}" "${TOOL_URLS[3]}"
                ;;

            4|04)
                run_remote "${TOOL_NAMES[4]}" "${TOOL_URLS[4]}"
                ;;

            5|05)
                run_remote "${TOOL_NAMES[5]}" "${TOOL_URLS[5]}"
                ;;

            6|06)
                run_remote "${TOOL_NAMES[6]}" "${TOOL_URLS[6]}"
                ;;

            7|07)
                run_remote "${TOOL_NAMES[7]}" "${TOOL_URLS[7]}"
                ;;

            8|08)
                run_remote "${TOOL_NAMES[8]}" "${TOOL_URLS[8]}"
                ;;

            9|09)
                run_remote "${TOOL_NAMES[9]}" "${TOOL_URLS[9]}"
                ;;

            0|back|b)
                return
                ;;

            *)
                printf '\n%b\n' "${RED}✖ Invalid utility selection.${RESET}"
                sleep 1
                ;;
        esac
    done
}

# ──────────────────────────────────────────────────────────────
# MAIN MENU
# ──────────────────────────────────────────────────────────────

main_menu() {

    while true; do

        header
        status_bar

        printf '%b\n' "${WHITE}${BOLD} MAIN CONTROL${RESET}"
        echo

        printf " ${MAGENTA}${BOLD}[1]${RESET} ${WHITE}${BOLD}Panels${RESET}        ${GRAY}Hosting panels & dashboard installers${RESET}\n"
        printf " ${BLUE}${BOLD}[2]${RESET} ${WHITE}${BOLD}Server Tools${RESET} ${GRAY}Security, Docker, SSL & VPS utilities${RESET}\n"
        printf " ${CYAN}${BOLD}[3]${RESET} ${WHITE}${BOLD}System Info${RESET}  ${GRAY}Refresh server telemetry${RESET}\n"

        echo
        line

        printf " ${RED}${BOLD}[0]${RESET} ${WHITE}${BOLD}Exit${RESET}           ${GRAY}Close Para Control Center${RESET}\n"

        echo
        printf '%b' "${CYAN}${BOLD} PARA › ${RESET}"

        read -r main_choice

        case "$main_choice" in

            1)
                panels_menu
                ;;

            2)
                tools_menu
                ;;

            3)
                sleep 1
                ;;

            0|exit|quit|q)
                clear

                echo
                printf '%b\n' "${PURPLE}╭────────────────────────────────────────────────────────────╮${RESET}"
                printf '%b\n' "${PURPLE}│${RESET} ${CYAN}${BOLD} PARA CONTROL CENTER${RESET}                               ${PURPLE}│${RESET}"
                printf '%b\n' "${PURPLE}│${RESET} ${GREEN}Session terminated successfully.${RESET}                   ${PURPLE}│${RESET}"
                printf '%b\n' "${PURPLE}│${RESET} ${GRAY}Credits: ${MAGENTA}Para${RESET}                                      ${PURPLE}│${RESET}"
                printf '%b\n' "${PURPLE}╰────────────────────────────────────────────────────────────╯${RESET}"
                echo

                exit 0
                ;;

            *)
                printf '\n%b\n' "${RED}✖ Invalid selection.${RESET}"
                sleep 1
                ;;
        esac
    done
}

# ──────────────────────────────────────────────────────────────
# START
# ──────────────────────────────────────────────────────────────

main_menu
```
