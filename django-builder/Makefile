.PHONY: deploy build static-upload

SHELL := /bin/bash

base_image := elbaschid/python-base
builder_image := elbaschid/django-builder
tester_image := elbaschid/django-tester

project_image := tutum.co/elbaschid/love-fear

build_dir := ./.build
venv_dir := ${build_dir}/venv
static_dir := ${build_dir}/static

git_sha := $(shell git rev-parse --verify HEAD --short)

base-image:
	docker build --rm -t $(base_image) -f docker/python-base.docker . 

builder-image:
	docker build --rm -t $(builder_image) -f docker/django-builder.docker . 

runner-image:
	docker build --rm -t $(runner_image) -f docker/django-runner.docker . 


deploy-base:
	docker push $(base_image)

deploy-builder:
	docker push $(builder_image)

deploy-runnter:
	docker push $(runner_image)


images:
	${MAKE} base-image
	${MAKE} builder-image


build:
	- rm -rf $(build_dir)
	docker-compose -f builder.yml run builder

deploy:
	docker tag $(project_image) $(project_image):$(git_sha)
	docker push $(project_image):$(git_sha)
	tutum service set --image $(project_image):$(git_sha) web.love-and-fear
	tutum service redeploy web.love-and-fear

migrate:
	tutum container exec `tutum container ps -s Running --no-trunc | grep web-1 | awk '{print $$2;}'` bash

app:
	${MAKE} base-image
	${MAKE} builder-image
	${MAKE} build
	${MAKE} production-image
