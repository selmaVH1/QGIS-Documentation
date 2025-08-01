# Makefile to run targets in docker containers

doctest:
	docker build -t qgis/documentation:latest -f doctest.dockerfile .
	docker run --rm \
		--env=QGIS_PREFIX_PATH=/usr \
		--env=PYTHONPATH=/usr/share/qgis/python \
		--user=$(shell id -u) \
		--volume=$(PWD):/documentation \
		qgis/documentation:latest
