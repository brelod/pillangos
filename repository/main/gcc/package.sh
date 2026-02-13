name=gcc
version=14.1.0
urls="
https://ftp.mpi-inf.mpg.de/mirrors/gnu/mirror/gcc.gnu.org/pub/gcc/releases/gcc-$version/gcc-$version.tar.gz
"

sha512sums="
d1ef7c8ba4134e7c64f715665f41eef5af30662352503442241a73772ce03de804ea4ca667353731b67c9fc66bdc2faec2bec3fd3d5bce1826c8ad545698345b  gcc-14.1.0.tar.gz
"

prepare() {
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
    sed '/thread_header =/s/@.*@/gthr-posix.h/' -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

    mkdir build
    pushd build

    ../configure \
        LD=ld \
        --prefix=/usr \
        --enable-languages=c,c++ \
        --enable-default-pie \
        --enable-default-ssp \
        --disable-multilib \
        --disable-bootstrap \
        --disable-fixincludes \
        --with-system-zlib

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
