#!/usr/bin/env bash
set -e

MYSQL_HOST="oxid6_mysql"
MYSQL_DATABASE="oxid6"
MYSQL_USER="oxid6"
MYSQL_PASS="UX6rg8AsaiR2"

# bootstrap oxid database/demodata
MYSQL_CHECKDATA=`mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DATABASE} --skip-column-names -e "SHOW TABLES FROM ${MYSQL_DATABASE} LIKE 'oxconfig';"`
if [ "${MYSQL_CHECKDATA}" = "" ]
then
	mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DATABASE} < /var/www/html/source/Setup/Sql/database_schema.sql
	mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DATABASE} < /var/www/html/vendor/oxid-esales/oxideshop-demodata-ce/src/demodata.sql
	mysql -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DATABASE} -e "UPDATE oxshops SET OXSMTP = 'mail.server:1025', OXSMTPUSER = '', OXSMTPPWD = '' WHERE oxid = 1;"
	mv /var/www/config.inc.php /var/www/html/source/config.inc.php
	rm -rf /var/www/html/source/Setup/
	composer run-script oe:views:regenerate
fi
