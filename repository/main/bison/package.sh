name=bison
version=3.8
urls="
https://ftp.gnu.org/pub/gnu/bison/bison-$version.tar.xz
"
sha512sums="
c1a10c460fa11a9e2c03cfc0494a33e41e09b7f0916d9b6c7660780fe42b09df80c65d44dadae64bbe9c53fb899f5e773bae5cf851cca65ce283fd0ef7e8f5bf  bison-3.8.tar.xz
"

prepare() {
    ./configure --prefix=/usr
}

compile() {
    make
}

install() {
    make install
}


