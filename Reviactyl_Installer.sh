#!/bin/bash

clear

# --- Typewriter Effect ---
typewriter() {
    text="$1"
    delay="${2:-0.02}"
    for ((i=0; i<${#text}; i++)); do
        echo -ne "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

# --- Banner ---
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
typewriter " 🚀 Reviactyl Auto Installer"
typewriter " 👨‍💻 Developed By: Para"
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo ""

# --- Input ---
read -p "🌐 Enter your domain (example: panel.example.com): " DOMAIN

# --- Dependencies ---
typewriter "📦 Installing dependencies..."
apt update -y && apt install -y curl apt-transport-https ca-certificates gnupg unzip git tar sudo lsb-release software-properties-common

# --- OS Detection ---
OS=$(lsb_release -is | tr '[:upper:]' '[:lower:]')

if [[ "$OS" == "ubuntu" ]]; then
    typewriter "🟢 Ubuntu detected → Adding PHP repo..."
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
elif [[ "$OS" == "debian" ]]; then
    typewriter "🟢 Debian detected → Adding PHP repo..."
    curl -fsSL https://packages.sury.org/php/apt.gpg | gpg --dearmor -o /usr/share/keyrings/sury-php.gpg
    echo "deb [signed-by=/usr/share/keyrings/sury-php.gpg] https://packages.sury.org/php/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/sury-php.list
fi

# --- Redis Repo ---
typewriter "🟥 Setting up Redis..."
curl -fsSL https://packages.redis.io/gpg | gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/redis.list

apt update -y

# --- Install Core ---
typewriter "🛠 Installing PHP, Nginx, MariaDB, Redis..."
apt install -y php8.3 php8.3-{cli,fpm,common,mysql,mbstring,bcmath,xml,zip,curl,gd,tokenizer} mariadb-server nginx redis-server

# --- Composer ---
typewriter "🎼 Installing Composer..."
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# --- Panel ---
typewriter "📥 Downloading Reviactyl Panel..."
mkdir -p /var/www/reviactyl && cd /var/www/reviactyl
curl -Lo panel.tar.gz https://github.com/reviactyl/panel/releases/latest/download/panel.tar.gz
tar -xzvf panel.tar.gz
chmod -R 755 storage bootstrap/cache

# --- Database ---
typewriter "🗄 Setting up database..."
DB_NAME=panel
DB_USER=reviactyl
DB_PASS=$(openssl rand -base64 10)

mariadb -e "CREATE DATABASE ${DB_NAME};"
mariadb -e "CREATE USER '${DB_USER}'@'127.0.0.1' IDENTIFIED BY '${DB_PASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'127.0.0.1'; FLUSH PRIVILEGES;"

# --- ENV ---
cp .env.example .env 2>/dev/null || curl -o .env.example https://raw.githubusercontent.com/reviactyl/panel/develop/.env.example && cp .env.example .env

sed -i "s|APP_URL=.*|APP_URL=https://${DOMAIN}|g" .env
sed -i "s|DB_DATABASE=.*|DB_DATABASE=${DB_NAME}|g" .env
sed -i "s|DB_USERNAME=.*|DB_USERNAME=${DB_USER}|g" .env
sed -i "s|DB_PASSWORD=.*|DB_PASSWORD=${DB_PASS}|g" .env

# --- Composer Install ---
typewriter "📦 Installing PHP dependencies..."
COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --optimize-autoloader

# --- Laravel Setup ---
typewriter "🔑 Generating key..."
php artisan key:generate --force

typewriter "📂 Migrating database..."
php artisan migrate --seed --force

# --- Permissions ---
typewriter "🔒 Setting permissions..."
chown -R www-data:www-data /var/www/reviactyl

# --- Cron ---
typewriter "⏰ Setting cron..."
(crontab -l 2>/dev/null; echo "* * * * * php /var/www/reviactyl/artisan schedule:run >> /dev/null 2>&1") | crontab -

# --- Nginx ---
typewriter "🌍 Configuring Nginx..."

cat > /etc/nginx/sites-available/reviactyl.conf <<EOF
server {
    listen 80;
    server_name ${DOMAIN};
    return 301 https://\$server_name\$request_uri;
}

server {
    listen 443 ssl;
    server_name ${DOMAIN};

    root /var/www/reviactyl/public;
    index index.php;

    ssl_certificate /etc/ssl/certs/ssl-cert-snakeoil.pem;
    ssl_certificate_key /etc/ssl/private/ssl-cert-snakeoil.key;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php8.3-fpm.sock;
    }
}
EOF

ln -s /etc/nginx/sites-available/reviactyl.conf /etc/nginx/sites-enabled/ 2>/dev/null
nginx -t && systemctl restart nginx

# --- Queue ---
typewriter "⚡ Setting queue worker..."

cat > /etc/systemd/system/reviq.service <<EOF
[Unit]
Description=Reviactyl Queue
After=redis-server.service

[Service]
User=www-data
ExecStart=/usr/bin/php /var/www/reviactyl/artisan queue:work
Restart=always

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reexec
systemctl enable --now reviq

# --- Admin ---
typewriter "👤 Create admin user..."
php artisan p:user:make

# --- Final ---
clear
echo -e "\e[1;32m✅ INSTALLATION COMPLETE\e[0m"
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
echo -e "🌐 Panel: https://${DOMAIN}"
echo -e "👤 DB User: ${DB_USER}"
echo -e "🔑 DB Pass: ${DB_PASS}"
echo -e "👨‍💻 Credits: Para"
echo -e "\e[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\e[0m"
