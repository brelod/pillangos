#!/bin/bash
set -e
set -u
set -o pipefail

source "$(dirname $0)/../config.sh"
exec &> >(tee "$CONF_CACHE_LOG_DIR/stage-3")


cd "$CONF_GIT_DIR/repository"
echo "================================================================================"
echo "Build packages"
echo "================================================================================"
source /root/.profile
cd /git/rust
export OPENSSL_LIB_DIR=/usr/lib
export OPENSSL_INCLUDE_DIR=/usr/include/openssl

# Without these rust flags there is a segfound in tokio watch.rs -- no idea why
export RUSTFLAGS="-Ctarget-feature=-crt-static"
export RUSTUP_TOOLCHAIN=stable 
cargo build --release --bin rmgr

echo "================================================================================"
echo "Cleanup"
echo "================================================================================"
rm -rvf /root/.cargo
rm -rvf /root/.rustup

echo "================================================================================"
echo "Create archive"
echo "================================================================================"
cd /
tar czvf "$CONF_CACHE_DIR/stage-3.tar.gz" \
    --exclude ./git \
    --exclude ./sys \
    --exclude ./dev \
    --exclude ./run \
    --exclude ./proc \
    .
