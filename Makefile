IMAGE_NAME=dajobe/boringssl
IMAGE_TAG=latest

DOCKER=podman

VERSION=$(shell awk '/^ENV BORINGSSL_VERSION/ {print $3}' Dockerfile)

build:
	@echo "Building $(IMAGE_NAME) image $(VERSION)"
	$(DOCKER) build -t $(IMAGE_NAME) .

# This won't work unless you have already set up the repository config
push:
	@echo "Pushing image to https://hub.docker.com/"
	$(DOCKER) push $(IMAGE_NAME):$(IMAGE_TAG)
