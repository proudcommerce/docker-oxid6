#!/usr/bin/env bash
set -e

# bootstrap oxid project
if [ ! -f /var/www/html/source/config.inc.php ]
then
	composer create-project --dev --keep-vcs oxid-esales/oxideshop-project . dev-b-6.0-ce
	chown -R www-data:www-data /var/www/html/source/
fi