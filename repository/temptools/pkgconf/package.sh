name=pkgconf
version=1.1.0
urls="
https://distfiles.dereferenced.org/pkgconf/pkgconf-$version.tar.xz
"

sha512sums="
2d54b14b9fb830a3d30e8812f6079a95cf1e1e77fd42d1eac7a6041347094ff88b79146be93c56625c44e2dcf38af725cbbdfdda09b457b921a9a17b97a23d15  pkgconf-1.1.0.tar.xz
"

prepare() {
    ./configure \
        --prefix=/usr \
        --host=$TARGET \
        --build=$BUILD
}

compile() {
    make
}

install() {
    make DESTDIR="$SYSROOT" install
    ln -sv pkgconf "$SYSROOT/usr/bin/pkg-config"
    ln -sv pkgconf.1 "$SYSROOT/usr/share/man/man1/pkg-config.1"
}


