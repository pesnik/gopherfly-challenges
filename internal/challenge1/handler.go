package challenge1

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

func (h *Handler) Start() error {
	h.node.Handle("echo", func(msg maelstrom.Message) error {
		var body map[string]any
		if err := json.Unmarshal(msg.Body, &body); err != nil {
			return err
		}

		body["type"] = "echo_ok"

		return h.node.Reply(msg, body)
	})
	return h.node.Run()
}
