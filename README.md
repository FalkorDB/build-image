# build-image
FalkorDB Docker build image

## Available Images

Build images are available for multiple architectures (amd64, arm64) and operating systems:

- `falkordb/falkordb-build:ubuntu` - Ubuntu 22.04 based image
- `falkordb/falkordb-build:debian` - Debian Bookworm based image
- `falkordb/falkordb-build:alpine` - Alpine Linux based image
- `falkordb/falkordb-build:rhel` - Red Hat UBI 9 based image
- `falkordb/falkordb-build:rhel8` - Red Hat UBI 8 based image

## Versioning

Build images are tagged with version numbers in the format: `falkordb/falkordb-build:$os-$version`

Examples:
- `falkordb/falkordb-build:ubuntu-1.0.0`
- `falkordb/falkordb-build:alpine-1.0.0`
- `falkordb/falkordb-build:debian-1.0.0`

### Release Process

1. Commit and push to `main` branch - this will build and push images with version tags
2. Alternatively, create a git tag (e.g., `v1.0.0` or `1.0.0`) - this will build and push images with the tag version (the 'v' prefix is automatically stripped)

Latest builds from the `main` branch are always tagged as `falkordb/falkordb-build:$os` (without version suffix).

**Note:** When using git tags, the 'v' prefix (if present) is automatically removed. For example, tag `v1.2.3` will create image `falkordb/falkordb-build:ubuntu-1.2.3`.
