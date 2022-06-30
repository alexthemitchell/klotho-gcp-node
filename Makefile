CONTAINER_NAME := alexthemitchell/klotho-node-gcp
CONTAINER_VERSION := 0.1.0

build:
	docker build . -t ${CONTAINER_NAME}:${CONTAINER_VERSION}

push: build
	docker push ${CONTAINER_NAME}:${CONTAINER_VERSION}

.PHONY: build
