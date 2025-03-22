.PHONY: build-all build-single-broadcast build-multi-broadcast build-echo build-unique-id test-echo test-unique-id test-single-broadcast test-multi-broadcast clean fmt go-test

MAELSTROM_PATH ?= ./maelstrom_src/maelstrom

build-all: build-echo build-unique-id build-single-broadcast build-multi-broadcast

# Challenge 1 - Echo
build-echo:
	@echo "Building echo service..."
	@cd cmd/challenge1 && go build -o echo

test-echo: build-echo
	@echo "Testing echo service..."
	@$(MAELSTROM_PATH) test -w echo --bin cmd/challenge1/echo --node-count 1 --time-limit 10

# Challenge 2 - Unique ID
build-unique-id:
	@echo "Building unique ID generator..."
	@cd cmd/challenge2 && go build -o unique-id

test-unique-id: build-unique-id
	@echo "Testing unique ID generator..."
	@$(MAELSTROM_PATH) test -w unique-ids --bin cmd/challenge2/unique-id --time-limit 30 --rate 1000 --node-count 3 --availability total --nemesis partition

# Challenge 3 - Broadcast
build-single-broadcast:
	@echo "Building single-node broadcast service..."
	@cd cmd/challenge3/broadcast-single && go build -o broadcast-single

test-single-broadcast: build-single-broadcast
	@echo "Testing single-node broadcast service..."
	@$(MAELSTROM_PATH) test -w broadcast --bin cmd/challenge3/broadcast-single/broadcast-single --node-count 1 --time-limit 20 --rate 10

build-multi-broadcast:
	@echo "Building multi-node broadcast service..."
	@cd cmd/challenge3/broadcast-multi && go build -o broadcast-multi

test-multi-broadcast: build-multi-broadcast
	@echo "Testing multi-node broadcast service..."
	@$(MAELSTROM_PATH) test -w broadcast --bin cmd/challenge3/broadcast-multi/broadcast-multi --node-count 5 --time-limit 20 --rate 10

build-fault-tolerant-broadcast:
	@echo "Building fault-tolerant broadcast service..."
	@cd cmd/challenge3/broadcast-fault-tolerant && go build -o broadcast-fault-tolerant

test-fault-tolerant-broadcast: build-fault-tolerant-broadcast
	@echo "Testing fault-tolerant broadcast service..."
	@$(MAELSTROM_PATH) test -w broadcast --bin cmd/challenge3/broadcast-fault-tolerant/broadcast-fault-tolerant --node-count 5 --time-limit 20 --rate 10 --nemesis partition

# Challenge 4 - Counter (placeholder)
build-counter-single:
	@echo "Building single-node counter service..."
	@cd cmd/challenge4/counter-single && go build -o counter-single

test-counter-single: build-counter-single
	@echo "Testing single-node counter service..."
	@$(MAELSTROM_PATH) test -w g-counter --bin cmd/challenge4/counter-single/counter-single --node-count 1 --rate 100 --time-limit 20

# Utility targets
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
	@rm -f cmd/challenge3/broadcast-single/broadcast-single
	@rm -f cmd/challenge3/broadcast-multi/broadcast-multi
	@rm -f cmd/challenge3/broadcast-fault-tolerant/broadcast-fault-tolerant
	@rm -f cmd/challenge4/counter-single/counter-single
