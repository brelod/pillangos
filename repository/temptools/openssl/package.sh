name=openssl
version=3.3.0
urls="
https://www.openssl.org/source/openssl-$version.tar.gz
"
sha512sums="
1f9daeee6542e1b831c65f1f87befaef98ccedc3abc958c9d17f064ef771924c30849e3ff880f94eed4aaa9d81ea105e3bc8815e6d2e4d6b60b5e890f14fc5da  openssl-3.3.0.tar.gz
"
prepare() {
    CC="gcc --sysroot=$SYSROOT" ./config \
        --prefix=/usr \
        --openssldir=/ect/ssl \
        --libdir=lib \
        shared 

    sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile
}

compile() {
    make
}

install() {
    make DESTDIR="$SYSROOT" install_sw
    make DESTDIR="$SYSROOT" install_ssldirs
}

