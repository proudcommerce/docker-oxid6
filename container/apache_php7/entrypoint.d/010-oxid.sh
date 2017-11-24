#!/usr/bin/env bash
set -e

# bootstrap oxid files/project
if [ ! -f /var/www/html/source/config.inc.php ]
then
	composer create-project --dev --keep-vcs oxid-esales/oxideshop-project . ${OXID_VERSION}
	mv /var/www/config.inc.php /var/www/html/source/config.inc.php
	chown -R www-data:www-data /var/www/html/source/
	echo "#####################################"
	echo "##### OXID bootstrap completed! #####"
	echo "#####################################"
fi
