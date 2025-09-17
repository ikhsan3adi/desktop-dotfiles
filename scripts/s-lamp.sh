function enable() {
  sudo systemctl enable --now \
  httpd.service \
  mariadb.service \
  php-fpm.service
}

function disable() {
  sudo systemctl disable --now \
  httpd.service \
  mariadb.service \
  php-fpm.service
}

if [ "$1" == "-d" ]; then
  disable

  echo "LAMP stack services stopped."
else
  enable

  echo "LAMP stack services started."
fi
