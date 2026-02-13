name=elfutils
version=0.191
urls="
https://sourceware.org/elfutils/ftp/$version/elfutils-$version.tar.bz2
"
sha512sums="
e22d85f25317a79b36d370347e50284c9120c86f9830f08791b7b6a7b4ad89b9bf4c7c71129133b8d193a0edffb2a2c17987b7e48428b9670aff5ce918777e04  elfutils-0.191.tar.bz2
"

prepare() {
    patch -p1 < "$PACKAGE_DIR/musl-macros.patch"

    ./configure \
        --prefix=/usr \
        --disable-debuginfod \
        --enable-libdebuginfod=dummy

    find -name Makefile -exec sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i "{}" \;

}

compile() {
    make
}

install() {
    make -C libelf install
    cp config/libelf.pc /usr/lib/pkgconfig
    chmod 644 /usr/lib/pkgconfig
}


