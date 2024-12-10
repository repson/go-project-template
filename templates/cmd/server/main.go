package main

import (
	"fmt"
	"my-go-project/internal/server"
	"net/http"
)

func main() {
	fmt.Println("Starting server on :8080...")
	srv := server.NewServer()
	if err := http.ListenAndServe(":8080", srv); err != nil {
		fmt.Println("Error starting server:", err)
	}
}
