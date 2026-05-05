# PiCon -- Pi Coding Agent Container

L'apéritif contre les hallucinations.

![PiCon](picon.jpg)

A containerized setup for the [Pi Coding Agent](https://pi.dev) by Mario Zechner.

## Features

- Sandbox with access to ~/.pi and app ($PWD) directory
- Easy local installation

## Prerequisites

- [Podman](https://podman.io/) (or Docker with minor adjustments)
- Bash shell

## Installation

```bash
git clone https://github.com/yourusername/pi-coding-agent-container.git
cd pi-coding-agent-container
./install.sh
```

## Usage

Navigate to your project directory and run picon:
```bash
picon
```

This will:
- Run the container with your current directory mounted as `/home/node/app`
  inside the container
- Mount your `~/.pi` directory to `/home/node/.pi` for persistent configuration
- Start the Pi Coding Agent

NOTE: make sure `~/.local/bin` is in your path (should already be the case).

## Configuration

The container mounts two volumes:
- `~/.pi` - For Pi Coding Agent configuration and cache
- Current directory - As the working directory for your projects

## License

This project is licensed under the MIT License. See [LICENSE](./LICENSE) for details.

## Acknowledgments

- [Mario Zechner](https://github.com/badlogic) for creating the Pi Coding Agent
- Node.js and Alpine Linux teams for their excellent base images
- Pi coding agent for creating this README.md
- Mistral Le Chat for the image.
