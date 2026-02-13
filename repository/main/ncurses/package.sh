name=ncurses
version=6.5
urls="
https://ftp.gnu.org/gnu/ncurses/ncurses-$version.tar.gz
"
sha512sums="
fc5a13409d2a530a1325776dcce3a99127ddc2c03999cfeb0065d0eee2d68456274fb1c7b3cc99c1937bc657d0e7fca97016e147f93c7821b5a4a6837db821e8  ncurses-6.5.tar.gz
"

prepare() {
    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --with-manpage-format=normal \
        --with-shared \
        --without-normal \
        --with-cxx-shared \
        --without-debug \
        --without-ada \
        --enable-widec \
        --enable-pc-files \
        --with-pkg-config-libdir=/usr/lib/pkgconfig

    sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
}

compile() {
    make
}

install() {
    make DESTDIR=$PWD/dest install
    cp dest/usr/lib/libncursesw.so.$version /usr/lib
    chmod 755 /usr/lib/libncursesw.so.$version
    rm -v dest/usr/lib/libncursesw.so.$version

    sed -e 's/^#if.*XOPEN.*$/#if 1/' -i dest/usr/include/curses.h
    cp -av dest/* /

    for lib in ncurses form panel menu ; do
        ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so
        ln -sfv ${lib}w.pc /usr/lib/pkgconfig/${lib}.pc
    done

    ln -sfv libncursesw.so /usr/lib/libcurses.so
}


