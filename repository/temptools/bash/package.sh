name=bash
version=5.2
urls="
https://ftp.gnu.org/pub/gnu/bash/bash-$version.tar.gz
"
sha512sums="
5647636223ba336bf33e0c65e516d8ebcf6932de8b44f37bc468eedb87579c628ad44213f78534beb10f47aebb9c6fa670cb0bed3b4e7717e5faf7e9a1ef81ae  bash-5.2.tar.gz
"

prepare() {
    ./configure \
        --prefix=/usr \
        --host=$TARGET \
        --build=$BUILD \
        --without-bash-malloc

    # Disable makeinfo
    sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
}

compile() {
    make
}

install() {
    make DESTDIR="$SYSROOT" install
    ln -fsv bash "$SYSROOT/bin/sh"
}

