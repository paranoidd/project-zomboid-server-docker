IMAGE_NAME="paranoidd/project-zomboid-server:latest"

default: docker_build docker_push

docker_build:
	docker build -t ${IMAGE_NAME} .

docker_push:
	docker push ${IMAGE_NAME}
