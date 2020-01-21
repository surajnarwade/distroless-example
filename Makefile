BIN = bin/app
BIN_LINUX = $(BIN)-linux

BUILD_NUMBER ?= SNAPSHOT-$(shell git rev-parse --short HEAD)

SOURCES := $(shell go list -f '{{$$dep := .}}{{range .GoFiles}}{{$$dep.Dir}}/{{.}} {{end}}' .)


build: $(SOURCES)
	GOARCH=amd64 GOOS=linux CGO_ENABLED=0 go build -o $(BIN_LINUX) $(SOURCES)

docker: 
	docker image build -t surajnarwade/trial-distro .

clean:
	rm -rf bin/
