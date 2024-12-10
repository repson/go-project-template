#!/bin/bash

echo "Building Go project..."
go build -o bin/app ./cmd/server/main.go

if [ $? -eq 0 ]; then
    echo "Build successful! Binary created at ./bin/app"
else
    echo "Build failed!"
    exit 1
fi
