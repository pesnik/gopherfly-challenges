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

```
gopherfly-challenges/                  # Root directory of your project
├── cmd/                              # Contains executable entry points for each challenge
│   ├── challenge1/                   # Directory for Challenge 1: Echo Service
│   │   ├── main.go                   # Main executable file for Challenge 1
│   │   └── README.md                 # Brief docs: goal, approach, key learnings, links to detailed docs
│   ├── challenge2/                   # Directory for Challenge 2: Unique ID Generator
│   │   ├── main.go                   # Main executable file for Challenge 2
│   │   └── README.md                 # Brief docs specific to Challenge 2
│   └── challengeN/                   # Placeholder for future challenges
│       ├── main.go                   # Main file for additional challenges
│       └── README.md                 # Per-challenge documentation
├── internal/                         # Internal packages specific to your project
│   ├── challenge1/                   # Logic specific to Challenge 1
│   │   ├── handler.go                # Business logic (e.g., echo service implementation)
│   │   └── types.go                  # Custom types or structs for Challenge 1
│   ├── challenge2/                   # Logic specific to Challenge 2
│   │   ├── handler.go                # Business logic (e.g., unique ID generation)
│   │   └── types.go                  # Custom types or structs for Challenge 2
│   └── common/                       # Shared internal utilities (if needed)
│       └── logger.go                 # Example: internal logging utility
├── pkg/                              # Reusable packages across challenges
│   ├── utils/                        # General-purpose utilities
│   │   ├── utils.go                  # Shared functions (e.g., string parsing, error handling)
│   │   └── network.go                # Network-related helpers (e.g., connection utilities)
│   └── middleware/                   # Example: reusable middleware (if applicable)
│       └── retry.go                  # Retry logic for network calls
├── docs/                             # Dedicated folder for comprehensive documentation
│   ├── README.md                     # Project-wide overview, index linking to all challenges
│   ├── challenge1/                   # Detailed docs for Challenge 1
│   │   ├── detailed_writeup.md       # In-depth explanation of solution and thought process
│   │   ├── echo_flow.png             # Doodle/diagram of message flow in echo service
│   │   └── resources.md              # List of resources used (e.g., tutorials, articles)
│   ├── challenge2/                   # Detailed docs for Challenge 2
│   │   ├── detailed_writeup.md       # Deep dive into unique ID generation
│   │   ├── id_system.jpg             # Diagram of ID generation process
│   │   └── resources.md              # Specific resources for Challenge 2
│   └── challengeN/                   # Placeholder for future challenge docs
│       ├── detailed_writeup.md       # Detailed notes for additional challenges
│       └── diagram.png               # Visual aids for future challenges
├── tests/                            # Optional: directory for integration or end-to-end tests
│   ├── challenge1_test.go            # Tests specific to Challenge 1
│   └── challenge2_test.go            # Tests specific to Challenge 2
├── go.mod                            # Go module file defining dependencies
├── go.sum                            # Checksums for dependency integrity
├── README.md                         # Top-level project README (overview, setup instructions)
└── LICENSE                           # MIT License file for your project
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
