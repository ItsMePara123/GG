#!/bin/bash

set -e

######################################################################################
#                                                                                    #
# Project 'pterodactyl-installer'                                                    #
# Modified by PARA (2025)                                                            #
#                                                                                    #
######################################################################################

# ---------------- Styled Echo Functions ---------------- #
output()   { echo -e "\e[1;34m📘 $1\e[0m"; }
success()  { echo -e "\e[1;32m✅ $1\e[0m"; }
error()    { echo -e "\e[1;31m❌ $1\e[0m"; }
warning()  { echo -e "\e[1;33m⚠️  $1\e[0m"; }
info()     { echo -e "\e[1;36mℹ️  $1\e[0m"; }
step() {
  echo -e "\n\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
  echo -e "\e[1;35m🚀 $1\e[0m"
  echo -e "\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m\n"
}

# ---------------- Ghost Typing Function ---------------- #
typewriter_echo() {
  text="$1"
  delay="${2:-0.05}" # default delay between letters
  for (( i=0; i<${#text}; i++ )); do
    echo -n "${text:$i:1}"
    sleep "$delay"
  done
  echo ""
}

# ---------------- Intro Credit ---------------- #
clear
echo -e "\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
typewriter_echo "👻 THIS INSTALLER IS FULLY MADE BY PARA"
typewriter_echo "⚠️  IF MODIFIED BY ANYONE, CREDIT MUST BE GIVEN"
echo -e "\e[1;35m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
sleep 2

# ---------------- Script Loader ---------------- #
fn_exists() { declare -F "$1" >/dev/null; }
if ! fn_exists lib_loaded; then
  source /tmp/lib.sh || source <(curl -sSL "$GITHUB_BASE_URL/$GITHUB_SOURCE"/lib/lib.sh)
  ! fn_exists lib_loaded && error "Could not load lib script" && exit 1
fi

# ------------------ Variables ----------------- #
FQDN="${FQDN:-localhost}"
MYSQL_DB="${MYSQL_DB:-panel}"
MYSQL_USER="${MYSQL_USER:-pterodactyl}"
MYSQL_PASSWORD="${MYSQL_PASSWORD:-$(gen_passwd 64)}"
timezone="${timezone:-Europe/Stockholm}"
ASSUME_SSL="${ASSUME_SSL:-false}"
CONFIGURE_LETSENCRYPT="${CONFIGURE_LETSENCRYPT:-false}"
CONFIGURE_FIREWALL="${CONFIGURE_FIREWALL:-false}"
email="${email:-}"
user_email="${user_email:-}"
user_username="${user_username:-}"
user_firstname="${user_firstname:-}"
user_lastname="${user_lastname:-}"
user_password="${user_password:-}"

if [[ -z "${email}" ]]; then error "Email is required 📧"; exit 1; fi
if [[ -z "${user_email}" ]]; then error "User email is required 📧"; exit 1; fi
if [[ -z "${user_username}" ]]; then error "User username is required 👤"; exit 1; fi
if [[ -z "${user_firstname}" ]]; then error "User firstname is required 📝"; exit 1; fi
if [[ -z "${user_lastname}" ]]; then error "User lastname is required 📝"; exit 1; fi
if [[ -z "${user_password}" ]]; then error "User password is required 🔑"; exit 1; fi

# --------- Main installation functions -------- #
install_composer() {
  step "Installing Composer"
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
  success "Composer installed 🎉"
}

ptdl_dl() {
  step "Downloading Pterodactyl panel files"
  mkdir -p /var/www/pterodactyl
  cd /var/www/pterodactyl || exit
  curl -Lo panel.tar.gz "$PANEL_DL_URL"
  tar -xzvf panel.tar.gz
  chmod -R 755 storage/* bootstrap/cache/
  cp .env.example .env
  success "Panel files downloaded 📦"
}

install_composer_deps() {
  step "Installing Composer dependencies"
  [ "$OS" == "rocky" ] || [ "$OS" == "almalinux" ] && export PATH=/usr/local/bin:$PATH
  COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader
  success "Composer dependencies installed ⚡"
}

configure() {
  step "Configuring environment"
  local app_url="http://$FQDN"
  [ "$ASSUME_SSL" == true ] && app_url="https://$FQDN"
  [ "$CONFIGURE_LETSENCRYPT" == true ] && app_url="https://$FQDN"

  php artisan key:generate --force
  php artisan p:environment:setup \
    --author="$email" \
    --url="$app_url" \
    --timezone="$timezone" \
    --cache="redis" \
    --session="redis" \
    --queue="redis" \
    --redis-host="localhost" \
    --redis-pass="null" \
    --redis-port="6379" \
    --settings-ui=true
  php artisan p:environment:database \
    --host="127.0.0.1" \
    --port="3306" \
    --database="$MYSQL_DB" \
    --username="$MYSQL_USER" \
    --password="$MYSQL_PASSWORD"
  php artisan migrate --seed --force
  php artisan p:user:make \
    --email="$user_email" \
    --username="$user_username" \
    --name-first="$user_firstname" \
    --name-last="$user_lastname" \
    --password="$user_password" \
    --admin=1
  success "Environment configured ✅"
}

set_folder_permissions() {
  step "Setting folder permissions"
  case "$OS" in
    debian | ubuntu) chown -R www-data:www-data ./* ;;
    rocky | almalinux) chown -R nginx:nginx ./* ;;
  esac
  success "Permissions set 🔐"
}

insert_cronjob() {
  step "Installing cronjob"
  crontab -l | { cat; echo "* * * * php /var/www/pterodactyl/artisan schedule:run >> /dev/null 2>&1"; } | crontab -
  success "Cronjob installed ⏰"
}

install_pteroq() {
  step "Installing pteroq service"
  curl -o /etc/systemd/system/pteroq.service "$GITHUB_URL"/configs/pteroq.service
  case "$OS" in
    debian | ubuntu) sed -i -e "s@<user>@www-data@g" /etc/systemd/system/pteroq.service ;;
    rocky | almalinux) sed -i -e "s@<user>@nginx@g" /etc/systemd/system/pteroq.service ;;
  esac
  systemctl enable pteroq.service
  systemctl start pteroq
  success "Pteroq installed 🛠️"
}

enable_services() {
  step "Enabling system services"
  case "$OS" in
    ubuntu | debian) systemctl enable redis-server && systemctl start redis-server ;;
    rocky | almalinux) systemctl enable redis && systemctl start redis ;;
  esac
  systemctl enable nginx
  systemctl enable mariadb
  systemctl start mariadb
  success "Services enabled ✅"
}

firewall_ports() {
  step "Configuring firewall"
  output "Opening ports: 22 (SSH), 80 (HTTP), 443 (HTTPS)"
  firewall_allow_ports "22 80 443"
  success "Firewall configured 🔥"
}

letsencrypt() {
  step "Configuring Let's Encrypt SSL"
  FAILED=false
  certbot --nginx --redirect --no-eff-email --email "$email" -d "$FQDN" || FAILED=true
  if [ ! -d "/etc/letsencrypt/live/$FQDN/" ] || [ "$FAILED" == true ]; then
    warning "Let's Encrypt certificate failed ❌"
    echo -n "* Still assume SSL? (y/N): "
    read -r CONFIGURE_SSL
    if [[ "$CONFIGURE_SSL" =~ [Yy] ]]; then
      ASSUME_SSL=true
      CONFIGURE_LETSENCRYPT=false
      configure_nginx
    else
      ASSUME_SSL=false
      CONFIGURE_LETSENCRYPT=false
    fi
  else
    success "SSL certificate installed 🔒"
  fi
}

configure_nginx() {
  step "Configuring Nginx"
  if [ "$ASSUME_SSL" == true ] && [ "$CONFIGURE_LETSENCRYPT" == false ]; then
    DL_FILE="nginx_ssl.conf"
  else
    DL_FILE="nginx.conf"
  fi
  case "$OS" in
    ubuntu | debian)
      PHP_SOCKET="/run/php/php8.3-fpm.sock"
      CONFIG_PATH_AVAIL="/etc/nginx/sites-available"
      CONFIG_PATH_ENABL="/etc/nginx/sites-enabled"
      ;;
    rocky | almalinux)
      PHP_SOCKET="/var/run/php-fpm/pterodactyl.sock"
      CONFIG_PATH_AVAIL="/etc/nginx/conf.d"
      CONFIG_PATH_ENABL="$CONFIG_PATH_AVAIL"
      ;;
  esac
  rm -rf "$CONFIG_PATH_ENABL"/default
  curl -o "$CONFIG_PATH_AVAIL"/pterodactyl.conf "$GITHUB_URL"/configs/$DL_FILE
  sed -i -e "s@<domain>@${FQDN}@g" "$CONFIG_PATH_AVAIL"/pterodactyl.conf
  sed -i -e "s@<php_socket>@${PHP_SOCKET}@g" "$CONFIG_PATH_AVAIL"/pterodactyl.conf
  case "$OS" in
    ubuntu | debian) ln -sf "$CONFIG_PATH_AVAIL"/pterodactyl.conf "$CONFIG_PATH_ENABL"/pterodactyl.conf ;;
  esac
  [ "$ASSUME_SSL" == false ] && [ "$CONFIGURE_LETSENCRYPT" == false ] && systemctl restart nginx
  success "Nginx configured 🌐"
}

perform_install() {
  step "Starting Pterodactyl installation"
  dep_install
  install_composer
  ptdl_dl
  install_composer_deps
  create_db_user "$MYSQL_USER" "$MYSQL_PASSWORD"
  create_db "$MYSQL_DB" "$MYSQL_USER"
  configure
  set_folder_permissions
  insert_cronjob
  install_pteroq
  configure_nginx
  [ "$CONFIGURE_LETSENCRYPT" == true ] && letsencrypt
  success "Pterodactyl installation complete 🎉🚀"
}

# ------------------- Install ------------------ #
perform_install
