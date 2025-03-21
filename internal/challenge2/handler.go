package challenge2

import (
	"encoding/json"
	"github.com/google/uuid"

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
	h.node.Handle("generate", func(msg maelstrom.Message) error {
		var body map[string]any
		if err := json.Unmarshal(msg.Body, &body); err != nil {
			return err
		}

		body["type"] = "generate_ok"
		body["id"] = uuid.NewString()

		return h.node.Reply(msg, body)
	})

	return h.node.Run()
}
