package main

import (
	"log"

	maelstrom "github.com/jepsen-io/maelstrom/demo/go"
	"github.com/pesnik/gopherfly-challenges/internal/challenge2"
)

func main() {
	n := maelstrom.NewNode()
	handler := challenge2.NewHandler(n)

	if err := handler.Start(); err != nil {
		log.Println(err)
	}
}
