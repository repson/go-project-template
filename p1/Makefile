.PHONY: build run test clean

build:
	@echo "Building the project..."
	go build -o bin/app ./cmd/server/main.go

run:
	@echo "Running the project..."
	./bin/app

test:
	@echo "Running tests..."
	go test ./...

clean:
	@echo "Cleaning up..."
	rm -rf bin/
