name=binutils
version=2.42
archive=$name-$version.tar.gz
urls="
https://ftp.gnu.org/pub/gnu/binutils/binutils-$version.tar.xz
"
sha512sums="
155f3ba14cd220102f4f29a4f1e5cfee3c48aa03b74603460d05afb73c70d6657a9d87eee6eb88bf13203fe6f31177a5c9addc04384e956e7da8069c8ecd20a6  binutils-2.42.tar.xz
"

prepare() {
    mkdir build
    pushd build

    ../configure \
        --prefix="$SYSROOT/tools" \
        --with-sysroot="$SYSROOT" \
        --target="$TARGET" \
        --disable-nls \
        --disable-werror \
        --enable-gprofng=no \
        --enable-default-hash-style=gnu

    # Disable makeinfo
    sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
    popd
}

compile() {
    pushd build
    make
    popd
}

install() {
    pushd build
    make install
    popd
}
