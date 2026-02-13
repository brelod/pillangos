name=argp
version=1.5.0
urls="
https://github.com/argp-standalone/argp-standalone/archive/refs/tags/$version.tar.gz
"
sha512sums="
fa2eb61ea00f7a13385e5c1e579dd88471d6ba3a13b6353e924fe71914b90b40688b42a9f1789bc246e03417fee1788b1990753cda8c8d4a544e85f26b63f9e2  1.5.0.tar.gz
"

prepare() {
    autoreconf -vif
    CFLAGS="-fPIC" ./configure --prefix=/usr
}

compile() {
    make
}

install() {
    cp -vf argp.h /usr/include/
    chmod 644 /usr/include/argp.h
    cp -vf libargp.a /usr/lib/
    chmod 755 /usr/lib/libargp.a
}
