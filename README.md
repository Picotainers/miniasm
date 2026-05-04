# miniasm
Source-built static `miniasm` container.

## Quick Usage

```bash
# Pull the image
docker pull docker.io/picotainers/miniasm:latest

# Run the tool
docker run --rm docker.io/picotainers/miniasm:latest miniasm --help
```

## Additional Example

```bash
docker run --rm -v "$(pwd):/data" docker.io/picotainers/miniasm:latest miniasm --help
```
