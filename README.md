# Docker OXID eShop 6
Docker Container with PHP 7, MySQL 5.7 and OXID eShop 6 (beta)

## Installation

- [Pull this repo](https://github.com/proudcommerce/docker-oxid6.git)
- [Install docker compose](https://docs.docker.com/compose/install/)
- Change into container directory: `cd container`
- Change volume mappings:
    `vi docker-compose.yml`
- Create docker images and container:
    `docker-compose build`
- Fire up docker container:
    `docker-compose up` (for background: `docker-compose up -d`)
- Connect to apache container:
    `docker exec -ti oxid6_apache bash`
- Change to www-root:
    `cd /var/www/html/`
- [Install composer](https://getcomposer.org/download/)
- [Install OXID](https://github.com/OXID-eSales/oxideshop_ce/tree/v6.0-beta.2#installation)
- Have fun ...


## Support

Feel free to create pull requests ;-)
