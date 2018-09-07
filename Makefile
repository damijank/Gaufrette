PHP_VERSION ?= 7.1

.PHONY: dev
dev:
	cp .env.dist .env

.PHONY: install-deps
install-deps:
	docker-compose run --rm php${PHP_VERSION} composer install

.PHONY: tests
tests:
	docker-compose run --rm php${PHP_VERSION} bin/tests

.PHONY: clear-deps
clear-deps:
	rm -rf vendor/ composer.lock
