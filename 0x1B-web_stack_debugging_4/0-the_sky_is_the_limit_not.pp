# Increases the number of requests that nginx can handle
# by increasing the maximum open files limit for the nginx user.

exec { 'set_ulimit_and_restart_nginx':
  command     => '/bin/sed -i "/ULIMIT/d" /etc/default/nginx && echo "ULIMIT=\"-n 5000\"" >> /etc/default/nginx && /usr/sbin/service nginx restart',
  onlyif      => '/bin/grep -q "ULIMIT=\"-n 5000\"" /etc/default/nginx',
  refreshonly => true,
}
