CURRENT_DIR:=$(shell PWD)
IMAGE_NAME=$(shell basename $(CURRENT_DIR))
TAG:="latest"
USERNAME:=""
PWD:=""
REGISTRY=tsungchh
CMD:=

login:
	docker login

rmcontainer:
	docker ps -a | grep "${REGISTRY}/${IMAGE_NAME}" | awk '{print $$1}' | xargs docker rm

rmimage:
	docker images | grep "${REGISTRY}/${IMAGE_NAME}" | awk '{print $$3}' | xargs docker rmi -f

clean: rmcontainer rmimage


push: build
	docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}

build:
	docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} .

run: build
	docker run -it ${REGISTRY}/${IMAGE_NAME}:${TAG} ${CMD}

.PHONY: login rmcontainer rmimage clean push build run