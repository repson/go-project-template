package server

import (
	"my-go-project/internal/handlers"
	"net/http"
)

// NewServer creates a new HTTP server with configured routes.
func NewServer() *http.ServeMux {
	mux := http.NewServeMux()
	mux.HandleFunc("/", handlers.HomeHandler)
	return mux
}
