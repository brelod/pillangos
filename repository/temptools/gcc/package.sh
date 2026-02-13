name=gcc
version=14.1.0
version_gmp=6.3.0
version_mpc=1.3.1
version_mpfr=4.2.1
urls="
https://ftp.gnu.org/pub/gnu/gmp/gmp-$version_gmp.tar.xz
https://ftp.gnu.org/pub/gnu/mpc/mpc-$version_mpc.tar.gz
https://ftp.gnu.org/pub/gnu/mpfr/mpfr-$version_mpfr.tar.xz
https://ftp.mpi-inf.mpg.de/mirrors/gnu/mirror/gcc.gnu.org/pub/gcc/releases/gcc-$version/gcc-$version.tar.gz
"

sha512sums="
d1ef7c8ba4134e7c64f715665f41eef5af30662352503442241a73772ce03de804ea4ca667353731b67c9fc66bdc2faec2bec3fd3d5bce1826c8ad545698345b  gcc-14.1.0.tar.gz
e85a0dab5195889948a3462189f0e0598d331d3457612e2d3350799dba2e244316d256f8161df5219538eb003e4b5343f989aaa00f96321559063ed8c8f29fd2  gmp-6.3.0.tar.xz
4bab4ef6076f8c5dfdc99d810b51108ced61ea2942ba0c1c932d624360a5473df20d32b300fc76f2ba4aa2a97e1f275c9fd494a1ba9f07c4cb2ad7ceaeb1ae97  mpc-1.3.1.tar.gz
bc68c0d755d5446403644833ecbb07e37360beca45f474297b5d5c40926df1efc3e2067eecffdf253f946288bcca39ca89b0613f545d46a9e767d1d4cf358475  mpfr-4.2.1.tar.xz
"

extract() {
    [ -e "$name" ] && rm -rf "$name"
    mkdir -vp "$name/"{gmp,mpc,mpfr}
    tar xf "gcc-$version.tar.gz" -C "$name" --strip-components 1
    tar xf "gmp-$version_gmp.tar.xz" -C "$name/gmp" --strip-components 1
    tar xf "mpc-$version_mpc.tar.gz" -C "$name/mpc" --strip-components 1
    tar xf "mpfr-$version_mpfr.tar.xz" -C "$name/mpfr" --strip-components 1
}

prepare() {
    sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64
    sed '/thread_header =/s/@.*@/gthr-posix.h/' -i libgcc/Makefile.in libstdc++-v3/include/Makefile.in

    mkdir build
    pushd build

    ../configure \
        --build=$BUILD \
        --host=$TARGET \
        --target=$TARGET \
        LDFLAGS_FOR_TARGET=-L$PWD/$TARGET/libgcc \
        --prefix=/usr \
        --with-build-sysroot="$SYSROOT" \
        --enable-default-pie \
        --enable-default-ssp \
        --disable-nls \
        --disable-multilib \
        --disable-libatomic \
        --disable-libgomp \
        --disable-libquadmath \
        --disable-libsanitizer \
        --disable-libssp \
        --disable-libvtv \
        --enable-languages=c,c++

    popd
}

compile() {
    pushd build
    make
    popd
}

install() {
    pushd build
    make DESTDIR="$SYSROOT" install
    ln -fsv gcc "$SYSROOT/usr/bin/cc"
}
