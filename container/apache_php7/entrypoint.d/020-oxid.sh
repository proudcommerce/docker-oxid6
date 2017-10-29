#!/usr/bin/env bash
set -e

OXID_EDITION="dev-b-6.0-ce"

# bootstrap oxid files/project
if [ ! -f /var/www/html/source/config.inc.php ]
then
	composer create-project --dev --keep-vcs oxid-esales/oxideshop-project . ${OXID_EDITION}
	chown -R www-data:www-data /var/www/html/source/
	echo "OXID bootstrap completed!"
fi
