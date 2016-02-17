default: build deploy test

deploy: build up test
redeploy: build provision test

build:
	GOOS=linux GOARCH=amd64 go build -o cookbooks/hithere/files/default/hithere

up:
	vagrant up

provision:
	vagrant provision

test:
	@for i in $$(seq 1 10); do \
		curl 192.168.0.2; echo; \
	done
