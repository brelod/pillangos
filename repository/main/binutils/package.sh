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
        --prefix=/usr \
        --sysconfdir=/etc \
        --enable-gold \
        --enable-ld=default \
        --enable-plugins \
        --enable-shared \
        --disable-werror \
        --enable-64-bit-bfd \
        --with-system-zlib \
        --enable-gprofng=no \
        --enable-default-hash-style=gnu

    # Disable makeinfo
    sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
    popd
}

compile() {
    pushd build
    make tooldir=/usr
    popd
}

install() {
    pushd build
    make tooldir=/usr install
    rm -fv /usr/lib/lib{bfd,ctf,ctf-nobfd,gprofng,opcodes,sframe}.a
    popd
}


