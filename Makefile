.PHONY: build-all build-single-broadcast test-single-broadcast  build-echo build-unique-id test-echo test-unique-id clean

MAELSTROM_PATH ?= ./maelstrom_src/maelstrom

build-all: build-echo build-unique-id build-single-broadcast

build-echo:
	@echo "Building echo service..."
	@cd cmd/challenge1 && go build -o echo

build-single-broadcast:
	@echo "Building single broadcast service..."
	@cd cmd/challenge3 && go build -o single-broadcast

build-unique-id:
	@echo "Building unique ID generator..."
	@cd cmd/challenge2 && go build -o unique-id

test-echo: build-echo
	@echo "Testing echo service..."
	@$(MAELSTROM_PATH) test -w echo --bin cmd/challenge1/echo --node-count 1 --time-limit 10

test-single-broadcast: build-single-broadcast
	@echo "Testing single broadcast service..."
	@$(MAELSTROM_PATH) test -w broadcast --bin cmd/challenge3/single-broadcast --node-count 1 --time-limit 20 --rate 10

test-unique-id: build-unique-id
	@echo "Testing unique ID generator..."
	@$(MAELSTROM_PATH) test -w unique-ids --bin cmd/challenge2/unique-id --time-limit 30 --rate 1000 --node-count 3 --availability total --nemesis partition

fmt:
	@echo "Formatting Go code..."
	@go fmt ./...

go-test:
	@echo "Running Go tests..."
	@go test ./...

clean:
	@echo "Cleaning build artifacts..."
	@rm -f cmd/challenge1/echo
	@rm -f cmd/challenge2/unique-id
	@rm -f cmd/challenge3/single-broadcast
