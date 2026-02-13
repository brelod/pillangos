name=ncurses
version=6.5
urls="
https://ftp.gnu.org/gnu/ncurses/ncurses-$version.tar.gz
"
sha512sums="
fc5a13409d2a530a1325776dcce3a99127ddc2c03999cfeb0065d0eee2d68456274fb1c7b3cc99c1937bc657d0e7fca97016e147f93c7821b5a4a6837db821e8  ncurses-6.5.tar.gz
"

prepare() {
    sed -i s/mawk// configure
    
    mkdir -p build
    pushd build
        ../configure
        # Disable makeinfo
        sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
        make -C include
        make -C progs tic
    popd

    ./configure \
        --prefix=/usr \
        --host=$TARGET \
        --build=$(./config.guess) \
        --mandir=/usr/share/man \
        --with-manpage-format=normal \
        --with-shared \
        --without-normal \
        --with-cxx-shared \
        --without-debug \
        --without-ada \
        --disable-stripping \
        --enable-widec

    # Disable makeinfo
    sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
}

compile() {
    make
}

install() {
    make DESTDIR="$SYSROOT" TIC_PATH=$(pwd)/build/progs/tic install
    ln -fsv libncursesw.so "$SYSROOT/usr/lib/libncurses.so"
    sed -e 's/^#if.*XOPEN.*$/#if 1/' -i "$SYSROOT/usr/include/curses.h"
}
