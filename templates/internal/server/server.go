package server

import (
	"net/http"
	"{{module-name}}/internal/handlers"
)

// NewServer creates a new HTTP server with configured routes.
func NewServer() *http.ServeMux {
	mux := http.NewServeMux()
	mux.HandleFunc("/", handlers.HomeHandler)
	return mux
}
