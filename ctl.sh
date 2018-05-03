#!/usr/bin/env bash

set -e

# ─ ┬ ┌ ┐ ─ ┴ └ ┘ │││ ├ ─ ┼ ┤

usage() {
    echo "┌──────────────────────────────────────────────────────────────────────────────────────────────────────────┐"
    echo "│                                                                                                          │"
    echo "│                     Controller for making svg pixel images from a source image                           │"
    echo "│                                                                                                          │"
    echo "├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤"
    echo "│                                                                                                          │"
    echo "│  Usage: ./ctl.sh <command> <flags>                                                                       │"
    echo "│                                                                                                          │"
    echo "│   command:                                                                                               │"
    echo "│        build                                                                                             │"
    echo "│        run <image_name>                                                                                  │"
    echo "│                                                                                                          │"
    echo "│   example:                                                                                               │"
    echo "│        ./ctl.sh run wave.png                                                                             │"
    echo "│                                                                                                          │"
    echo "└──────────────────────────────────────────────────────────────────────────────────────────────────────────┘"
}


run() {
    docker run \
        -it \
        --rm \
        --name pixel2svg \
        -v $(pwd):$(pwd) \
        pixel2svg:latest \
        "$(pwd)"/"${1}" "${@:2}"
}

build() {
    docker build -f Dockerfile -t pixel2svg:latest .
}

case "$1" in
  (--help|-h)
    usage
    exit 0
    ;;
  (build)
    build
    exit 0
    ;;
  (run)
    run "${@:2}"
    exit 0
    ;;
  (*)
    usage
esac
