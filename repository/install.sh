#!/bin/bash
set -e
set -u
set +h
set -o pipefail


BASE_DIR="$(dirname $(realpath $0))/"

# ==============================================================================
# Functions
# ==============================================================================
download() {
    for url in $urls; do
        archive="${url##*/}"
        [ -e "$archive" ] && continue
        wget --no-check-certificate --continue $url
    done

    echo "$sha512sums" | sed '/^$/d' > "$CONF_CACHE_SHA_DIR/$repository-$package"
    sha512sum -c "$CONF_CACHE_SHA_DIR/$repository-$package"
}

extract() {
    for url in $urls; do
        archive="${url##*/}"

        case "$archive" in
            *.tar.gz|*.tar.xz|*.tar.bz2) 
                [ -e "$BUILD_DIR" ] && rm -rf "$BUILD_DIR"
                mkdir -pv "$BUILD_DIR"
                tar xf "$archive" -C "$BUILD_DIR" --strip-components 1
                ;;
            *) 
                echo "Archive '$archive' is not supported"
                exit 1
                ;;
        esac
    done
}

prepare() {
    ./configure
}

compile() {
    make
}

install() {
    make install
}

cleanup() {
    rm -vf "$CONF_CACHE_SHA_DIR/$repository-$package"
    rm -rf "$BUILD_DIR"
}


# ==============================================================================
# Main
# ==============================================================================
package="${1:?Missing package}"
repository="${2:-main}"

PACKAGE_DIR="$BASE_DIR/$repository/$package"
if [ ! -e "$PACKAGE_DIR" ]; then
    echo "Package '$package' not found in repository '$repository'"
    exit 1
fi
BUILD_DIR="$CONF_CACHE_SRC_DIR/$package"

mkdir -p "$CONF_CACHE_SRC_DIR"
mkdir -p "$CONF_CACHE_SHA_DIR"
mkdir -p "$CONF_CACHE_LOG_DIR"

exec &> >(tee "$CONF_CACHE_LOG_DIR/$repository-$package")

export CFLAGS=
export MAKEFLAGS=-j15
source "$BASE_DIR/$repository/config.sh"
source "$PACKAGE_DIR/package.sh"

ALL=true
DOWNLOAD=false
EXTRACT=false
PREPARE=false
COMPILE=false
INSTALL=false
CLEANUP=false

for arg in "${@}"; do
    case "$arg" in
        --download) ALL=false; DOWNLOAD=true;;
        --extract)  ALL=false; EXTRACT=true;;
        --prepare)  ALL=false; PREPARE=true;;
        --compile)  ALL=false; COMPILE=true;;
        --install)  ALL=false; INSTALL=true;;
        --cleanup)  ALL=false; CLEANUP=true;;
    esac
done


if [ $ALL = true -o $DOWNLOAD = true ]; then
    echo "================================================================================"
    echo "Download ($repository/$package)"
    echo "================================================================================"
    cd "$CONF_CACHE_SRC_DIR" && download
fi

if [ $ALL = true -o $EXTRACT = true ]; then
    echo "================================================================================"
    echo "Extract ($repository/$package)"
    echo "================================================================================"
    cd "$CONF_CACHE_SRC_DIR" && extract
fi

if [ $ALL = true -o $PREPARE = true ]; then
    echo "================================================================================"
    echo "Prepare ($repository/$package)"
    echo "================================================================================"
    cd "$CONF_CACHE_SRC_DIR/$name" && prepare
fi

if [ $ALL = true -o $COMPILE = true ]; then
    echo "================================================================================"
    echo "Compile ($repository/$package)"
    echo "================================================================================"
    cd "$CONF_CACHE_SRC_DIR/$name" && compile
fi

if [ $ALL = true -o $INSTALL = true ]; then
    echo "================================================================================"
    echo "Install ($repository/$package)"
    echo "================================================================================"
    cd "$CONF_CACHE_SRC_DIR/$name" && install
fi

if [ $ALL = true -o $CLEANUP = true ]; then
    echo "================================================================================"
    echo "Cleanup ($repository/$package)"
    echo "================================================================================"
    cd "$CONF_CACHE_SRC_DIR" && cleanup
fi

