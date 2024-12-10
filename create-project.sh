#!/bin/bash

# Script to generate a complete Go project structure using file templates
set -e

# Check if project name is provided
if [ $# -lt 1 ]; then
    echo "Usage: $0 <project-name> [username] [license]"
    exit 1
fi

# Variables
PROJECT_NAME=$1
USERNAME=${2:-"username"} # Default to "username" if not provided
LICENSE=${3:-"MIT"} # Default to "MIT" if not provided
TEMPLATE_DIR="templates"
LICENSE_DIR="$TEMPLATE_DIR/licenses"
MODULE_NAME="github.com/$USERNAME/$PROJECT_NAME"

# Extract Go version dynamically
GO_VERSION=$(go version | grep -oE 'go[0-9]+\.[0-9]+(\.[0-9]+)?' | sed 's/go//')

if [ -z "$GO_VERSION" ]; then
    echo "Could not detect Go version. Ensure Go is installed and in your PATH."
    exit 1
fi

echo "Creating Go project: $PROJECT_NAME..."
echo "Using module name: $MODULE_NAME"
echo "Detected Go version: $GO_VERSION"
echo "License: $LICENSE"

# Function to process template files and replace placeholders
process_template() {
    local src=$1
    local dest=$2
    mkdir -p "$(dirname "$dest")"

    # Replace placeholders {{module-name}} and {{project-name}}
    sed -e "s|{{module-name}}|$MODULE_NAME|g" \
        -e "s|{{project-name}}|$PROJECT_NAME|g" \
        -e "s|{{go-version}}|$GO_VERSION|g" \
        -e "s|{{year}}|$(date +%Y)|g" \
        -e "s|{{username}}|$USERNAME|g" \
        "$src" > "$dest"

    echo "Created $dest"
}

# Add LICENSE file
add_license() {
    # local license_file="$LICENSE_DIR/$LICENSE.txt"
    local license_file="$LICENSE_DIR/$LICENSE.txt"
    local dest="$PROJECT_NAME/LICENSE"

    if [ -f "$license_file" ]; then
        process_template "$license_file" "$dest"
    else
        echo -e "\nERROR: License type '$LICENSE' not found. Skipping LICENSE file."
    fi
}

# Create directory structure
mkdir -p $PROJECT_NAME/{cmd/server,configs,internal/{server,handlers},pkg/utils,scripts,test}

# Initialize go.mod
mkdir -p "$PROJECT_NAME"
echo "module $MODULE_NAME

go $GO_VERSION" > "$PROJECT_NAME/go.mod"

# Process templates and replace placeholders
process_template "$TEMPLATE_DIR/.gitignore" "$PROJECT_NAME/.gitignore"
process_template "$TEMPLATE_DIR/docker-compose.yml" "$PROJECT_NAME/docker-compose.yml"
process_template "$TEMPLATE_DIR/Dockerfile" "$PROJECT_NAME/Dockerfile"
process_template "$TEMPLATE_DIR/README.md" "$PROJECT_NAME/README.md"
process_template "$TEMPLATE_DIR/Makefile" "$PROJECT_NAME/Makefile"
process_template "$TEMPLATE_DIR/configs/config.yaml" "$PROJECT_NAME/configs/config.yaml"
process_template "$TEMPLATE_DIR/cmd/server/main.go" "$PROJECT_NAME/cmd/server/main.go"
process_template "$TEMPLATE_DIR/internal/server/server.go" "$PROJECT_NAME/internal/server/server.go"
process_template "$TEMPLATE_DIR/internal/handlers/handler.go" "$PROJECT_NAME/internal/handlers/handler.go"
process_template "$TEMPLATE_DIR/pkg/utils/logger.go" "$PROJECT_NAME/pkg/utils/logger.go"
process_template "$TEMPLATE_DIR/scripts/build.sh" "$PROJECT_NAME/scripts/build.sh"
process_template "$TEMPLATE_DIR/test/integration_test.go" "$PROJECT_NAME/test/integration_test.go"

# Add LICENSE file
add_license

# Make the build script executable
chmod +x "$PROJECT_NAME/scripts/build.sh"

echo -e "\nProject structure created successfully!"
echo -e "\nNavigate to $PROJECT_NAME and run the following commands:\n"
echo "1. Initialize the Go module: cd $PROJECT_NAME && go mod tidy"
echo "2. Build the project: make build"
echo "3. Run the project: make run"
