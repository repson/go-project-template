# Go Project Template

This repository provides a simple way to generate a clean Go project structure automatically.

## Features

- Creates the recommended directory structure for Go projects.
- Adds common files like `go.mod`, `.gitignore`, and `Makefile`.

## Usage

1. Clone this repository:

```
$ bash git clone https://github.com/yourusername/go-project-template.git
$ cd go-project-template
```

2. Run the script to create a new project:

```$ ./create-project.sh my-go-project```

3. Navigate to your project directory:

```$ cd my-go-project```

4. Initialize Go modules and start coding:

```$ go mod tidy```

## Structure

The generated project will have the following structure:

```
my-go-project/
├── cmd/
│   └── server/
│       └── main.go       # Entry point for the application
├── configs/
│   └── config.yaml       # Configuration file
├── internal/
│   ├── server/
│   │   └── server.go     # Server implementation
│   └── handlers/
│       └── handler.go    # Example HTTP handler
├── pkg/
│   └── utils/
│       └── logger.go     # Reusable utility for logging
├── scripts/
│   └── build.sh          # Automation script to build the project
├── test/
│   └── integration_test.go # Basic integration test
├── go.mod
├── Makefile
└── README.md
```

## How It Works

1. Build the project:

Run the build script or use the Makefile.

```$ make build```

2. Run the server:

Start the application.

```$ ./bin/app```

3. Testing:

Execute the tests to ensure everything works as espected.

```$ make test```

4. Configurations:

Update the config/config.yml file to modify parameters like the server port or database settings.