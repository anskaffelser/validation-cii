PROJECT=$(shell pwd)
VERSION := $(if $(GITHUB_REF),$(shell echo "$(GITHUB_REF)" | sed "s:.*/::g"),snapshot)

default: pull build

pull:
	@docker pull difi/vefa-validator

build:
	@docker run --rm -i \
		-v $(PROJECT):/src \
		difi/vefa-validator \
		build -x -n org.unece.uncefact.cii -b $(VERSION) /src
