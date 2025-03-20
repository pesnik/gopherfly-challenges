.PHONY: build-all build-echo test-echo clean

MAELSTROM_PATH ?= ./maelstrom_src/maelstrom

build-all: build-echo

build-echo:
	@echo "Building echo service..."
	@cd cmd/challenge1 && go build -o echo

test-echo: build-echo
	@echo "Testing echo service..."
	@$(MAELSTROM_PATH) test -w echo --bin cmd/challenge1/echo --node-count 1 --time-limit 10

fmt:
	@echo "Formatting Go code..."
	@go fmt ./...

go-test:
	@echo "Running Go tests..."
	@go test ./...

clean:
	@echo "Cleaning build artifacts..."
	@rm -f cmd/challenge1/echo
