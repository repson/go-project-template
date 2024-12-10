package handlers

import (
	"fmt"
	"net/http"
)

// HomeHandler handles the root route.
func HomeHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to p1!")
}
