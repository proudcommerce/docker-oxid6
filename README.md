# Docker OXID eShop 6

This setup bootstraps an dockerized developer environment for [OXID eShop 6](https://github.com/OXID-eSales/oxideshop_ce).

## Overview

- Apache 2.4 container PHP 7.1 ([Dockerfile](container/apache_php7/Dockerfile))
- MySQL 5.7 container ([Dockerfile](https://github.com/docker-library/mysql/blob/883703dfb30d9c197e0059a669c4bb64d55f6e0d/5.7/Dockerfile))
- MailHog container ([Dockerfile](https://github.com/mailhog/MailHog/blob/master/Dockerfile))
- OXID composer project dev-b-6.0-ce ([6.0.0-rc.2 --dev](https://github.com/OXID-eSales/oxideshop_ce/blob/v6.0.0-rc.2/composer.json))
- OXID demo data

## Quickstart

```bash
# clone repository:
git clone https://github.com/proudcommerce/docker-oxid6.git docker_oxid6
cd docker_oxid6
# create container
docker-compose build
# fire up container
docker-compose up
```
## Configuration

### Installation
- Creating oxid project takes round about 5 minutes. It´s finished when `data/www/source/.htaccess` exists (or log shows `OXID bootstrap completed!`).
- Shop url: `http://oxid6.localhost`
- Shop admin `http://oxid6.localhost/admin/`, credentials: `admin / admin`
- MailHog web gui: `http://oxid6.localhost:8025` (port see `.env` file)

### Container
- If you would like to run container in background, use `docker-compose up -d` for starting container and `docker logs -f oxid6_apache` for log information (eg. composer information).

### Credentials
- You can change container credentials (domain, ports, database) in `.env` file.
- If you change domain/port, edit `container/apache_php7/files/config.inc.php`.
- If you change database credentials, edit `container/apache_php7/files/config.inc.php` and `container/apache_php7/entrypoint.d/030-demodata.sh`.

### OXID demo data
- Normally oxid demo data will be installed automatically.
- If you only need a clean project, without demo data, remove `container/apache_php7/entrypoint.d/030-demodata.sh` before building the container.

## Support

[https://forum.oxid-esales.com/t/docker-container-fur-oxid-6/92282](https://forum.oxid-esales.com/t/docker-container-fur-oxid-6/92282)

## License

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    

## Copyright

	Proud Sourcing GmbH 2017
	www.proudcommerce.com / www.proudsourcing.de
