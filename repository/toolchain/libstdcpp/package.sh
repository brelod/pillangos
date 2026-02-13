name=gcc
version=14.1.0
urls="
https://ftp.mpi-inf.mpg.de/mirrors/gnu/mirror/gcc.gnu.org/pub/gcc/releases/gcc-$version/gcc-$version.tar.gz
"

sha512sums="
d1ef7c8ba4134e7c64f715665f41eef5af30662352503442241a73772ce03de804ea4ca667353731b67c9fc66bdc2faec2bec3fd3d5bce1826c8ad545698345b  gcc-14.1.0.tar.gz
"

prepare() {
    mkdir build
    pushd build

    ../libstdc++-v3/configure \
        --host=$TARGET \
        --build=$(../config.guess) \
        --prefix=/usr \
        --disable-nls \
        --disable-multilib \
        --disable-libstdcxx-pch \
        --with-gxx-include-dir=/tools/$TARGET/include/c++/$version
}

compile() {
    pushd build
    make
    popd
}

install() {
    pushd build
    make DESTDIR="$SYSROOT" install
    popd
}



