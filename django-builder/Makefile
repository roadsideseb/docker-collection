SHELL := /bin/bash

base_image := elbaschid/python-base
builder_image := elbaschid/django-builder
runner_image := elbaschid/django-runner


base-image:
	docker build --rm -t $(base_image):2.7 -f 2.7/python-base.docker . 
	docker build --rm -t $(base_image):3.4 -f 3.4/python-base.docker . 

builder-image:
	docker build --rm -t $(builder_image):2.7 -f 2.7/django-builder.docker . 
	docker build --rm -t $(builder_image):3.4 -f 3.4/django-builder.docker . 

runner-image:
	docker build --rm -t $(runner_image):2.7 -f 2.7/django-runner.docker . 
	docker build --rm -t $(runner_image):3.4 -f 3.4/django-runner.docker . 


deploy-base:
	docker push $(base_image)

deploy-builder:
	docker push $(builder_image)

deploy-runner:
	docker push $(runner_image)


all:
	${MAKE} base-image builder-image
	${MAKE} deploy-base deploy-builder
