name=zlib
version=1.3.1
urls="
https://www.zlib.net/zlib-$version.tar.gz
"
sha512sums="
580677aad97093829090d4b605ac81c50327e74a6c2de0b85dd2e8525553f3ddde17556ea46f8f007f89e435493c9a20bc997d1ef1c1c2c23274528e3c46b94f  zlib-1.3.1.tar.gz
"

prepare() {
    ./configure --prefix=/usr

    find -name Makefile -exec sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i "{}" \;
}

compile() {
    make
}

install() {
    make install
}


