package server

import (
	"net/http"
	"github.com/repson/p1/internal/handlers"
)

// NewServer creates a new HTTP server with configured routes.
func NewServer() *http.ServeMux {
	mux := http.NewServeMux()
	mux.HandleFunc("/", handlers.HomeHandler)
	return mux
}
