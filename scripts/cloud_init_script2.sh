#!/bin/bash
echo "$(date): user data script started." > /tmp/log

echo "$(date): setting up webserver." >> /tmp/log
apt-get update -y
apt-get install apache2 php net-tools stress -y
service apache2 start
echo 'ForensicLog ${APACHE_LOG_DIR}/forensic_log.log' >> /etc/apache2/apache2.conf
echo 'AddHandler lua-script .lua' >> /etc/apache2/apache2.conf
a2enmod log_forensic lua
service apache2 restart
update-rc.d apache2 defaults

echo "$(date): generating webserver content." >> /tmp/log
echo "Hello, DevTalks 2022, from Server 2 powered by IONOS Cloud!" > /var/www/html/index.html
echo "<html><body><h1>Server 2 is healthy</h1></body></html>" > /var/www/html/healthy.html
echo "function handle(r)
        r.usleep(5000000)
        return apache2.DECLINED
end
" > /var/www/html/delay.lua
echo "function handle(r)
        r.usleep(60000000)
        return apache2.DECLINED
end
" > /var/www/html/unhealthy.lua

echo "$(date): user data script completed." >> /tmp/log
