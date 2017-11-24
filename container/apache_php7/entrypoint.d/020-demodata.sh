#!/usr/bin/env bash
set -e

INSTALL_DEMODATA=${OXID_DEMODATA}

# bootstrap oxid database/demodata
MYSQL_CHECKDATA=`mysql -h oxid6_mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} --skip-column-names -e "SHOW TABLES FROM ${MYSQL_DATABASE} LIKE 'oxconfig';"`
if [ "${MYSQL_CHECKDATA}" = "" ]
then
    mysql -h oxid6_mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /var/www/html/source/Setup/Sql/database_schema.sql
    mysql -h oxid6_mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} -e "UPDATE oxshops SET OXSMTP = 'mail.server:1025', OXSMTPUSER = '', OXSMTPPWD = '' WHERE oxid = 1;"
    if [ "${INSTALL_DEMODATA}" = true ]
    then
        mysql -h oxid6_mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < /var/www/html/vendor/oxid-esales/oxideshop-demodata-ce/src/demodata.sql
        rm -rf /var/www/html/source/Setup/
    fi
    /var/www/html/vendor/bin/oe-eshop-db_views_regenerate
fi
