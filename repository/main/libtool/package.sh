name=libtool
version=2.4
urls="
https://ftp.gnu.org/pub/gnu/libtool/libtool-$version.tar.xz
"

sha512sums="
6b706656cbe8a18d9b377b913d7430984abe4bcff1db1bfba3e32e7eff38eca433cd95a507f8aafd96daf28e6426eed14c98fcdb79bae63d56c93503d107b4df  libtool-2.4.tar.xz
"

# depends on: perl

prepare() {
    ./configure --prefix=/usr
}

compile() {
    make
}

install() {
    make install
}
