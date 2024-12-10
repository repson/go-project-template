package utils

import (
	"log"
)

// LogInfo logs informational messages.
func LogInfo(message string) {
	log.Println("[INFO]:", message)
}

// LogError logs error messages.
func LogError(err error) {
	log.Println("[ERROR]:", err)
}
