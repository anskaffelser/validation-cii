PROJECT=$(shell pwd)
BUILD=$(shell git rev-parse HEAD)

.PHONY: d16b

default: pull d16b

pull:
	@docker pull difi/vefa-validator

d16b:
	@docker run --rm -i \
		-v $(PROJECT):/src \
		difi/vefa-validator \
		build -x -n org.unece.uncefact.d16b.cii -a d16b -b $(BUILD) -target d16b/target /src
