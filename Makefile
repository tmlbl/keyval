default: image

IMAGE_NAME=tmlbl/keyval

.jdeps:
	jvm install

.PHONY: image
image: .jdeps
	jvm package
	docker build -t $(IMAGE_NAME) .

