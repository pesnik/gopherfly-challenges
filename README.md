# gopherfly-challenges

A collection of solutions to the [Fly.io Distributed Systems Challenges](https://fly.io/dist-sys/) implemented in Go. Each solution is designed with a modular and pragmatic approach, following best practices for scalable and maintainable distributed systems.

## Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Challenges](#challenges)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)

## Overview

**gopherfly-challenges** is your go-to repository for exploring and solving distributed systems challenges provided by Fly.io. The project is implemented in Go, leveraging its simplicity and performance to tackle various problems such as echo services, unique ID generation, and more.

## Project Structure

The repository is organized into modules to enhance readability and maintainability:

```plaintext
gopherfly-challenges/
├── cmd/
│   ├── challenge1/
│   │   └── main.go         # Entry point for Challenge 1: Echo Service
│   ├── challenge2/
│   │   └── main.go         # Entry point for Challenge 2: Unique ID Generator
│   └── ...                 # Additional challenge entry points
├── internal/
│   ├── challenge1/
│   │   ├── handler.go      # Business logic for Challenge 1
│   │   └── ...             # Additional internal components for Challenge 1
│   ├── challenge2/
│   │   ├── handler.go      # Business logic for Challenge 2
│   │   └── ...             # Additional internal components for Challenge 2
│   └── ...                 # Other internal packages
├── pkg/
│   ├── utils/
│   │   └── utils.go        # Shared utility functions and packages
│   └── ...                 # Additional shared packages
├── go.mod                  # Go module file
├── go.sum                  # Go dependency checksums
├── README.md               # This file
└── LICENSE                 # License file
```

## Challenges

Each challenge is self-contained in its own module within the `cmd/` directory. For example:

- **Challenge 1: Echo Service**
  - **Description:** Implements a service that echoes back the received message.
  - **Location:** `cmd/challenge1`
  - **Status:** Completed

- **Challenge 2: Unique ID Generator**
  - **Description:** Generates globally unique IDs for distributed systems.
  - **Location:** `cmd/challenge2`
  - **Status:** Completed

*Additional challenges will follow the same structure. For more details about each challenge, refer to the documentation in the respective subdirectory.*

## Prerequisites

- [Go](https://golang.org/doc/install) 1.16 or later
- Git
- (Optional) Docker for containerized testing or deployment

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/pesnik/gopherfly-challenges.git
   cd gopherfly-challenges
   ```

2. **Install dependencies:**
   Ensure you have Go modules enabled and run:
   ```bash
   go mod tidy
   ```

## Usage

Each challenge has its own executable. To run a specific challenge, navigate to its directory and execute the main file. For example:

- **Running the Echo Service:**
   ```bash
   cd cmd/challenge1
   go run main.go
   ```

- **Running the Unique ID Generator:**
   ```bash
   cd cmd/challenge2
   go run main.go
   ```

For detailed usage instructions, refer to the documentation provided in each challenge's subdirectory.

## Testing

Tests have been provided for each challenge to ensure reliability:

- **Run all tests:**
  ```bash
  go test ./...
  ```
  
- **Run tests for a specific challenge:**
  Navigate to the challenge directory and run:
  ```bash
  go test
  ```

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Commit your changes with descriptive messages.
4. Push your changes to your fork.
5. Open a pull request for review.

Please adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) for community standards.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Fly.io Distributed Systems Challenges](https://fly.io/dist-sys/) for providing the inspiring challenge sets.
- The Go community for their ongoing contributions and best practices.
