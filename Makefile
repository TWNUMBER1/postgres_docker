CURRENT_DIR:=$(shell PWD)
IMAGE_NAME=$(shell basename $(CURRENT_DIR))
TAG:="latest"
USERNAME:=""
PWD:=""
REGISTRY=tsungchh
CMD:=

login:
	docker login

stop:
	docker ps | grep "${REGISTRY}/${IMAGE_NAME}" | awk '{print $$1}' | xargs docker stop

rmc:
	docker ps -a | grep "${REGISTRY}/${IMAGE_NAME}" | awk '{print $$1}' | xargs docker rm

rmi:
	docker images | grep "${REGISTRY}/${IMAGE_NAME}" | awk '{print $$3}' | xargs docker rmi -f

rmdangling:
	docker images --quiet --filter "dangling=true" | xargs docker rmi

clean: stop rmc rmi rmdangling

build:
ifeq ($(TAG), "latest")
	docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} .
else
	docker build -t ${REGISTRY}/${IMAGE_NAME}:latest . && \
	docker tag ${REGISTRY}/${IMAGE_NAME}:latest ${REGISTRY}/${IMAGE_NAME}:${TAG}
endif

push: build
ifeq ($(TAG),)
	docker push ${REGISTRY}/${IMAGE_NAME}:latest
else
	docker push ${REGISTRY}/${IMAGE_NAME}:${TAG} && docker push ${REGISTRY}/${IMAGE_NAME}:latest
endif


run: build
	docker run -it -p 5432:5432 ${REGISTRY}/${IMAGE_NAME}:${TAG} ${CMD}

.PHONY: login rmc rmi rmdangling clean push build run