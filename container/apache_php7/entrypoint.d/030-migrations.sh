#!/usr/bin/env bash
set -e

vendor/bin/oe-eshop-db_migrate migrations:migrate