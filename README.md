# Docker OXID eShop 6

This setup bootstraps an dockerized developer environment for [OXID eShop 6](https://github.com/OXID-eSales/oxideshop_ce).

## Overview

- Apache 2.4 container PHP 7.1 ([Dockerfile](container/apache_php7/Dockerfile))
- MySQL 5.7 container ([Dockerfile](https://github.com/docker-library/mysql/blob/883703dfb30d9c197e0059a669c4bb64d55f6e0d/5.7/Dockerfile))
- OXID composer project dev-b-6.0-ce (incl. dev requirements)
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
- Creating oxid project takes rund about 5 minutes. It´s finished when `data/www/source/.htaccess` exists.
- Shop url: `http://localhost`
- Shop admin credentials: `admin / admin`

### Credentials
- You can change container credentials (domain, ports, database) in `.env` file.
- If you change domain/port, edit `container/apache_php7/files/config.inc.php`.
- If you change database credentials, edit `container/apache_php7/files/config.inc.php` and `container/apache_php7/entrypoint.d/030-demodata.sh`.

### OXID demo data
- Normally oxid demo data will be installed automatically.
- If you only need a clean project, without demo data, remove `container/apache_php7/entrypoint.d/030-demodata.sh` before building the container.

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
