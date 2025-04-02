# Dynamo Build Container

This repository contains the build environment container for Dynamo projects.

## Prerequisites

- Docker installed on your system
- Git (for cloning the repository)

## Building the Container

1. Build the Docker image:
   ```bash
   docker build -f Dockerfile -t dynamo-build . 
   ```

2. Upload the image to a container registry:
   ```bash
   docker push <registry>/dynamo-build:latest
   ```

## Usage

You can run the container in two ways:

### Interactive Mode

To start an interactive shell session:

```bash
docker run -it --rm dynamo-build /bin/bash
```

### Build Mode

To run a specific build command:

```bash
docker run -v $(pwd):/workspace --rm dynamo-build <build-command>
```

## Environment Details

The container includes:
- Ubuntu as the base image
- Essential build tools and dependencies
- Pre-configured build environment for Dynamo projects

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
