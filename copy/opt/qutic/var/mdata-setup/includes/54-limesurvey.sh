if mdata-get server_name 1>/dev/null 2>&1; then
  SERVER_NAME=`mdata-get server_name`
  sed -i "s:SERVER_NAME:$SERVER_NAME:g" /opt/local/etc/httpd/vhosts/01-limesurvey.conf
else
  sed -i "s:ServerName SERVER_NAME::g" /opt/local/etc/httpd/vhosts/01-limesurvey.conf
fi

if mdata-get server_alias 1>/dev/null 2>&1; then
  SERVER_ALIAS=`mdata-get server_alias`
  sed -i "s:SERVER_ALIAS:$SERVER_ALIAS:g" /opt/local/etc/httpd/vhosts/01-limesurvey.conf
else
  sed -i "s:ServerAlias SERVER_ALIAS::g" /opt/local/etc/httpd/vhosts/01-limesurvey.conf
fi

if mdata-get mysql_host 1>/dev/null 2>&1; then
  MYSQL_HOST=`mdata-get mysql_host`
  MYSQL_USER=`mdata-get mysql_user`
  MYSQL_DB=`mdata-get mysql_database`
  MYSQL_PWD=`mdata-get mysql_password`
  sed -i \
      -e "s/mysql:host=localhost;port=3306;dbname=limesurvey;/mysql:host=${MYSQL_HOST};port=3306;dbname=${MYSQL_DB};/" \
      -e "s/'username' => 'root',/'username' => '${MYSQL_USER}',/" \
      -e "s/'password' => 'root',/'password' => '${MYSQL_PWD}',/" \
      /var/www/htdocs/limesurvey/current/application/config/config.php
fi

# Enable apache by default
/usr/sbin/svcadm enable svc:/pkgsrc/apache:default
