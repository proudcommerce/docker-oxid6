#!/usr/bin/env bash
set -e

MYSQL_DATABASE="oxid6"
MYSQL_USER="oxid6"
MYSQL_PASS="RynwtffQJr2EnNaTgGEQ"

# bootstrap oxid database/demodata
MYSQL_CHECKDATA=`mysql -h oxid6_mysql -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DATABASE} --skip-column-names -e "SHOW TABLES FROM ${MYSQL_DATABASE} LIKE 'oxconfig';"`
if [ "${MYSQL_CHECKDATA}" = "" ]
then
	mysql -h oxid6_mysql -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DATABASE} < /var/www/html/source/Setup/Sql/database_schema.sql
	mysql -h oxid6_mysql -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DATABASE} < /var/www/html/vendor/oxid-esales/oxideshop-demodata-ce/src/demodata.sql
	mv /var/www/config.inc.php /var/www/html/source/config.inc.php
	composer run-script oe:views:regenerate
fi
