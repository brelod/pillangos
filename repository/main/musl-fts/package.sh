name=musl-fts
version=1.2.7
urls="
https://github.com/void-linux/musl-fts/archive/refs/tags/v$version.tar.gz
"

sha512sums="
949f73b9406b06bd8712c721b4ec89afcb37d4eaef5666cccf3712242d3a57fc0acf3ca994934e0f57c1e92f40521a9370132a21eb6d1957415a83c76bf20feb  ./v1.2.7.tar.gz
"

# depends on: libtool aclocal autoconf autoheader automake

prepare() {
    ./bootstrap.sh
    ./configure --prefix=/usr
}

compile() {
    make
}

install() {
    make install
}

