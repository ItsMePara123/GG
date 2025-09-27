#!/bin/bash
set -e

######################################################################################
#                                                                                    #
#   FULL INSTALLER                                                                   #
#   Made by PARA (2025)                                                              #
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
  delay="${2:-0.05}"
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

# ---------------- Variables ---------------- #
FQDN="${FQDN:-localhost}"
MYSQL_DB="${MYSQL_DB:-panel}"
MYSQL_USER="${MYSQL_USER:-pterodactyl}"
MYSQL_PASSWORD="${MYSQL_PASSWORD:-$(openssl rand -hex 16)}"
timezone="${timezone:-Europe/Stockholm}"
email="${email:-admin@example.com}"
user_email="${user_email:-admin@example.com}"
user_username="${user_username:-admin}"
user_firstname="${user_firstname:-Admin}"
user_lastname="${user_lastname:-User}"
user_password="${user_password:-$(openssl rand -hex 12)}"

# ---------------- Functions ---------------- #
install_dependencies() {
  step "Updating system and installing dependencies"
  apt update -y && apt upgrade -y
  apt install -y curl wget unzip tar nginx mariadb-server redis-server \
    php8.3 php8.3-cli php8.3-gd php8.3-mysql php8.3-mbstring php8.3-bcmath \
    php8.3-xml php8.3-curl composer certbot python3-certbot-nginx
  success "Dependencies installed"
}

setup_database() {
  step "Setting up MariaDB database"
  mysql -u root <<MYSQL_SCRIPT
CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'127.0.0.1' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USER'@'127.0.0.1';
FLUSH PRIVILEGES;
MYSQL_SCRIPT
  success "Database setup complete"
}

install_panel() {
  step "Downloading and installing Pterodactyl Panel"
  mkdir -p /var/www/pterodactyl
  cd /var/www/pterodactyl
  curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
  tar -xzvf panel.tar.gz
  chmod -R 755 storage/* bootstrap/cache/
  cp .env.example .env
  success "Panel installed"
}

configure_panel() {
  step "Configuring Pterodactyl environment"
  php artisan key:generate --force
  php artisan p:environment:setup \
    --author="$email" \
    --url="http://$FQDN" \
    --timezone="$timezone" \
    --cache="redis" \
    --session="redis" \
    --queue="redis" \
    --redis-host="127.0.0.1" \
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
  success "Panel configured"
}

setup_permissions() {
  step "Setting folder permissions"
  chown -R www-data:www-data /var/www/pterodactyl
  success "Permissions set"
}

setup_cron() {
  step "Setting up cron job"
  (crontab -l 2>/dev/null; echo "* * * * * php /var/www/pterodactyl/artisan schedule:run >> /dev/null 2>&1") | crontab -
  success "Cron job installed"
}

setup_queue_worker() {
  step "Setting up queue worker"
  cat > /etc/systemd/system/pteroq.service <<EOF
[Unit]
Description=Pterodactyl Queue Worker
After=redis-server.service

[Service]
User=www-data
Group=www-data
Restart=always
ExecStart=/usr/bin/php /var/www/pterodactyl/artisan queue:work --queue=high,standard,low --sleep=3 --tries=3

[Install]
WantedBy=multi-user.target
EOF
  systemctl enable --now pteroq
  success "Queue worker service setup"
}

configure_nginx() {
  step "Configuring Nginx"
  cat > /etc/nginx/sites-available/pterodactyl.conf <<EOF
server {
    listen 80;
    server_name $FQDN;

    root /var/www/pterodactyl/public;

    index index.php;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.3-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF
  ln -sf /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/pterodactyl.conf
  nginx -t && systemctl restart nginx
  success "Nginx configured"
}

setup_ssl() {
  step "Setting up Let's Encrypt SSL"
  certbot --nginx --non-interactive --agree-tos -m "$email" -d "$FQDN" || warning "SSL setup failed"
  success "SSL configured (if successful)"
}

# ---------------- Run All Steps ---------------- #
install_dependencies
setup_database
install_panel
configure_panel
setup_permissions
setup_cron
setup_queue_worker
configure_nginx
setup_ssl

success "🎉 Installation completed successfully!"
output "Login: http://$FQDN"
output "Admin Email: $user_email"
output "Admin Password: $user_password"
