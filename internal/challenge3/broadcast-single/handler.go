package singleBroadcast

import (
	"encoding/json"

	maelstrom "github.com/jepsen-io/maelstrom/demo/go"
)

type Handler struct {
	node *maelstrom.Node
}

func NewHandler(n *maelstrom.Node) *Handler {
	return &Handler{
		node: n,
	}
}

var seen_messages = []int{}

func (h *Handler) Start() error {
	h.node.Handle("broadcast", func(msg maelstrom.Message) error {
		var body map[string]any = make(map[string]any)
		if err := json.Unmarshal(msg.Body, &body); err != nil {
			return err
		}

		if message, ok := body["message"].(float64); ok {
			seen_messages = append(seen_messages, int(message))
		}

		return h.node.Reply(msg, map[string]any{
			"type": "broadcast_ok",
		})
	})

	h.node.Handle("read", func(msg maelstrom.Message) error {
		var body map[string]any = make(map[string]any)

		body["type"] = "read_ok"
		body["messages"] = seen_messages

		return h.node.Reply(msg, body)
	})

	h.node.Handle("topology", func(msg maelstrom.Message) error {
		var body map[string]any = make(map[string]any)

		body["type"] = "topology_ok"

		return h.node.Reply(msg, body)
	})

	return h.node.Run()
}
