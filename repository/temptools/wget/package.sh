name=wget
version=1.24.5
urls="
https://ftp.gnu.org/gnu/wget/wget-$version.tar.gz
"
sha512sums="
572aa54717e51a9eb9959e127c7afb696645088f32ff7df2cfe9d243957e34ee235e98988fa94649df023d2e3d62b6973e8c9f2eb92beba820dd96d5de2a950d  wget-1.24.5.tar.gz
"
prepare() {
    ./configure \
        --prefix="$SYSROOT/usr" \
        --sysconfdir=/etc \
        --disable-nls \
        --with-ssl=openssl \
        --host=$TARGET \
        --build=$BUILD
}

compile() {
    make
}

install() {
    make DESTDIR="$SYSROOT" install
}


