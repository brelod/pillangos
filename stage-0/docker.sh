#!/bin/bash
set -e
set -u

BASE_DIR="$(dirname $(realpath $0))/.."
source "$BASE_DIR/config.sh"

# ==============================================================================
# Help
# ==============================================================================
help() {
    [[ "$1" != "" ]] && echo -e "Error: $1\n"
    echo "Usage: $0 <target>"
    echo "Targets:"
    echo " - login"
    echo " - build"
    echo " - push"
    echo " - pull"
    echo " - run"
    exit 1;
}

# ==============================================================================
# Functions
# ==============================================================================
login() {
    docker login "$CONF_DOCKER_IMAGE_REPO.$CONF_DOCKER_IMAGE_HOST"
}

build() {
    docker build -t "$CONF_DOCKER_IMAGE_TAG_STAGE_0" .
}

push() {
    docker push "$CONF_DOCKER_IMAGE_TAG_STAGE_0"
}

pull() {
    docker pull "$CONF_DOCKER_IMAGE_TAG_STAGE_0"
}

run() {
    docker run -t -it --rm \
        --mount type=bind,src="$BASE_DIR",target="$CONF_GIT_DIR" \
        --network host \
        "$CONF_DOCKER_IMAGE_TAG_STAGE_0" \
        "--init-file" "$CONF_GIT_DIR/config.sh"
}

# ==============================================================================
# Validate arguments
# ==============================================================================
target="${1:-help}"

case "$target" in
    login) login;;
    build) build;;
    push) push;;
    pull) pull;;
    run) run;;
    help) help "";;
    *) help "Invalid target '$target'";;
esac
