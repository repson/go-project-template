package main

import (
	"fmt"
	"net/http"
	"{{module-name}}/internal/server"
)

func main() {
	fmt.Println("Starting server on :8080...")
	srv := server.NewServer()
	if err := http.ListenAndServe(":8080", srv); err != nil {
		fmt.Println("Error starting server:", err)
	}
}
