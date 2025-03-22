package main

import (
	"log"

	maelstrom "github.com/jepsen-io/maelstrom/demo/go"
	"github.com/pesnik/gopherfly-challenges/internal/challenge3/broadcast-single"
)

func main() {
	n := maelstrom.NewNode()
	handler := singleBroadcast.NewHandler(n)

	if err := handler.Start(); err != nil {
		log.Println(err)
	}
}
