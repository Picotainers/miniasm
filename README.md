# miniasm
Source-built static `miniasm` container for ultrafast overlap-layout genome assembly from long noisy reads.

## Quick Usage
```bash
docker run --rm docker.io/picotainers/miniasm --help
```

## Usage
Show help:
```bash
docker run --rm docker.io/picotainers/miniasm --help
```

Run assembly (mount current directory as `/data`):
```bash
docker run --rm -v "$(pwd):/data" docker.io/picotainers/miniasm -f /data/reads.fq /data/overlaps.paf > assembly.gfa
```

## Building
```bash
docker build -t picotainers/miniasm .
```