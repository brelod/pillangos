name=make
version=4.4.1
urls="
https://ftp.gnu.org/pub/gnu/make/make-$version.tar.gz
"
sha512sums="
145260cbd6a8226cef3dfef0c8baba31847beaebc7e6b65d39d02715fd4f4cab9b139b6c3772e550088d4f9ae80c6d3ed20b9a7664c693644dfb96b4cb60e67c  make-4.4.1.tar.gz
"
prepare() {
    ./configure \
        --prefix=/usr \
        --without-guile

    # Disable makeinfo
    sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
}

compile() {
    make
}

install() {
    make install
}
