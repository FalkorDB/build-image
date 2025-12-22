# build-image
FalkorDB Docker build image

## Available Images

Build images are available for multiple architectures (amd64, arm64) and operating systems:

- `falkordb/falkordb-build:ubuntu` - Ubuntu 22.04 based image
- `falkordb/falkordb-build:debian` - Debian Bookworm based image
- `falkordb/falkordb-build:alpine` - Alpine Linux based image
- `falkordb/falkordb-build:rhel` - Red Hat UBI 9 based image
- `falkordb/falkordb-build:rhel8` - Red Hat UBI 8 based image
- `falkordb/falkordb-build:rhel9` - Red Hat UBI 9 based image
- `falkordb/falkordb-build:amazonlinux2` - Amazon Linux 2 based image (glibc baseline for AL2)
- `falkordb/falkordb-build:amazonlinux2023` - Amazon Linux 2023 based image

## Versioning

Build images are tagged based on the branch or git tag:

### Main Branch Builds
- `falkordb/falkordb-build:ubuntu` - Latest build for ubuntu
- `falkordb/falkordb-build:ubuntu-edge` - Edge/development build for ubuntu

### Tagged Releases
- `falkordb/falkordb-build:ubuntu-1.0.0` - Specific version release

Examples:
- `falkordb/falkordb-build:ubuntu-1.0.0`
- `falkordb/falkordb-build:alpine-2.1.5`
- `falkordb/falkordb-build:debian-edge`

### Release Process

To create a versioned release:

1. Create a git tag with the version number (e.g., `v1.0.0` or `1.0.0`)
2. Push the tag to GitHub
3. The CI workflow will automatically build and push images with the version tag

**Note:** The 'v' prefix in git tags is automatically stripped. For example, tag `v1.2.3` will create image `falkordb/falkordb-build:ubuntu-1.2.3`.
