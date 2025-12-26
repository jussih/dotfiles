#!/bin/bash
set -e

echo "=== Debian Dotfiles Installation Test ==="
echo ""

# Detect container runtime
CONTAINER_CMD=""
if command -v docker &> /dev/null; then
    CONTAINER_CMD="docker"
    echo "Using Docker"
elif command -v podman &> /dev/null; then
    CONTAINER_CMD="podman"
    echo "Using Podman"
else
    echo "Error: Neither docker nor podman found. Please install one of them."
    exit 1
fi

# Configuration
IMAGE="debian:trixie"
CONTAINER_NAME="dotfiles-test-$$"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

echo "Container runtime: $CONTAINER_CMD"
echo "Test image: $IMAGE"
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# Cleanup function
cleanup() {
    echo ""
    echo "Cleaning up container..."
    $CONTAINER_CMD stop "$CONTAINER_NAME" &> /dev/null || true
    $CONTAINER_CMD rm -f "$CONTAINER_NAME" &> /dev/null || true
}
trap cleanup EXIT

# Clean up any existing container with the same name
echo "Checking for existing containers..."
$CONTAINER_CMD stop "$CONTAINER_NAME" &> /dev/null || true
$CONTAINER_CMD rm -f "$CONTAINER_NAME" &> /dev/null || true

echo "=== Starting test container ==="
$CONTAINER_CMD run -d \
    --name "$CONTAINER_NAME" \
    --volume "$DOTFILES_DIR:/home/testuser/dotfiles:ro,Z" \
    "$IMAGE" \
    sleep infinity

echo ""
echo "=== Setting up test environment ==="
$CONTAINER_CMD exec "$CONTAINER_NAME" bash -c '
    set -e

    # Install sudo and basic dependencies
    apt-get update -qq
    apt-get install -y -qq sudo > /dev/null

    # Create test user with passwordless sudo
    useradd -m -s /bin/bash testuser
    mkdir -p /etc/sudoers.d
    echo "testuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/testuser
    chmod 0440 /etc/sudoers.d/testuser

    # Fix ownership of home directory (Docker creates it as root when mounting the volume)
    chown testuser:testuser /home/testuser

    echo "Test environment ready"
'

echo ""
echo "=== Running: scripts/bootstrap_debian.sh ==="
echo ""

if $CONTAINER_CMD exec --user testuser --workdir /home/testuser/dotfiles/scripts "$CONTAINER_NAME" ./bootstrap_debian.sh; then
    echo "Bootstrap complete."
else
    echo "Bootstrap failed!"
    exit 1
fi

echo ""
echo "=== Running: make debian ==="
echo ""

# Run make debian as testuser
if $CONTAINER_CMD exec --user testuser --workdir /home/testuser/dotfiles "$CONTAINER_NAME" make debian; then
    echo ""
    echo "=== Test Result: SUCCESS ==="
    echo ""
    echo "Installation completed successfully!"
    exit 0
else
    echo ""
    echo "=== Test Result: FAILED ==="
    echo ""
    echo "Installation failed. Check the output above for errors."
    exit 1
fi
