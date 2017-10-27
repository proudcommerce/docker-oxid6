# Docker OXID eShop 6
Docker Container with PHP 7, MySQL 5.7 and OXID eShop 6.

## Installation

- Get this repository
	`git clone https://github.com/proudcommerce/docker-oxid6.git`
- Create docker container:
    `docker-compose build`
- Fire up docker container:
    `docker-compose up` (for background: `docker-compose up -d`)
- Have fun
	`http://localhost`


## Some notices

### OXID Bootstrap

- OXID composer project (dev-b-6.0-ce) will be created automatically.
- This takes some minutes. Finished when autoloader.php exists.

### Demo data

- Demo data and customized confing.inc.php will be installed/created also automatically.
- If you need a clean project, remove container/apache_php7/entrypoint.d/030-demodata.sh before building the container.
- Shop admin credentials: admin / admin

### Changing database credentials/domain/port

- If you change the domain/port/database credentials in the .env file, you also have to edit container/apache_php7/entrypoint.d/030-demodata.sh and container/apache_php7/files/config.inc.php (if demo data should be installed).


## Support

Feel free to create pull requests ;-)
