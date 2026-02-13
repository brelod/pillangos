#!/bin/bash
set -e
set -u
set -o pipefail

source "$(dirname $0)/../config.sh"

SYSROOT="$CONF_CACHE_DIR/stage-1"

echo "================================================================================"
echo "Create basic layout"
echo "================================================================================"
mkdir -vp "$SYSROOT"/{etc,var,lib64,tools}
mkdir -vp "$SYSROOT"/usr/{lib,bin,sbin}
mkdir -vp "$SYSROOT"/{dev,proc,sys,run,tmp}

for path in bin lib sbin; do
    ln -fsv "usr/$path" "$SYSROOT"
done

cat > "$SYSROOT/etc/hosts" <<EOF
127.0.0.1 localhost localhost
::1 localhost
EOF

cat > "$SYSROOT/etc/passwd" <<EOF
root:x:0:0:root:/root:/bin/bash
EOF

cat > "$SYSROOT/etc/group" << "EOF"
root:x:0:
EOF

cat > "$SYSROOT/etc/resolv.conf" << "EOF"
nameserver 8.8.8.8
EOF

cd "$CONF_GIT_DIR/repository"
echo "================================================================================"
echo "Build cross-toolchain"
echo "================================================================================"
./install.sh binutils      toolchain
./install.sh gcc           toolchain
./install.sh linux-headers toolchain
./install.sh musl          toolchain
./install.sh libstdcpp     toolchain

echo "================================================================================"
echo "Build temporary packages"
echo "================================================================================"
./install.sh m4         temptools
./install.sh make       temptools
./install.sh ncurses    temptools
./install.sh bash       temptools
./install.sh busybox    temptools
./install.sh binutils   temptools
./install.sh gcc        temptools

echo "================================================================================"
echo "Cleanup"
echo "================================================================================"
find "$SYSROOT"/usr/{lib,libexec} -name \*.la -delete
rm -rf "$SYSROOT"/usr/share/{info,man,doc}/*
rm -rf "$SYSROOT/tools"


echo "================================================================================"
echo "Create archive"
echo "================================================================================"
tar czvf "$CONF_CACHE_DIR/stage-1.tar.gz" -C "$SYSROOT" .
