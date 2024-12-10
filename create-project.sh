#!/bin/bash

# Script to generate a Go project structure

# Usage: ./create-project.sh <project-name>
set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <project-name>"
    exit 1
fi

PROJECT_NAME=$1

echo "Creating Go project: $PROJECT_NAME"

# Directories
mkdir -p $PROJECT_NAME/{cmd,internal,pkg,configs,scripts,test}

# Files
cat > $PROJECT_NAME/go.mod <<EOF
module github.com/yourusername/$PROJECT_NAME

go 1.21
EOF

cat > $PROJECT_NAME/README.md <<EOF
# $PROJECT_NAME

## Description
This is a Go project generated using the Go project template.

## Structure
- **cmd/**: Main applications.
- **internal/**: Private application code.
- **pkg/**: Public reusable packages.
- **configs/**: Configuration files.
- **scripts/**: Automation scripts.
- **test/**: Tests.

## Usage
Run the following command to initialize:
\`\`\`bash
go mod tidy
\`\`\`
EOF

cat > $PROJECT_NAME/.gitignore <<EOF
# Binaries
*.exe
*.out
*.test

# Directories
/vendor/
/bin/
/build/
/dist/
/coverage/

# OS Files
.DS_Store
Thumbs.db
EOF

cat > $PROJECT_NAME/Makefile <<EOF
.PHONY: build test clean

build:
\tgo build -o bin/app ./cmd/app

test:
\tgo test ./...

clean:
\trm -rf bin
EOF

echo "Project structure created successfully!"
