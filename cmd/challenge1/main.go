package main

import (
	"log"

	maelstrom "github.com/jepsen-io/maelstrom/demo/go"
	"github.com/pesnik/gopherfly-challenges/internal/challenge1"
)

func main() {
	n := maelstrom.NewNode()

	handler := challenge1.NewHandler(n)
	if err := handler.Start(); err != nil {
		log.Fatalf("Failed to start echo service: %v", err)
	}
}
