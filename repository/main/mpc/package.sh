name=mpc
version=1.3.1
urls="
https://ftp.gnu.org/pub/gnu/mpc/mpc-$version.tar.gz
"
sha512sums="
4bab4ef6076f8c5dfdc99d810b51108ced61ea2942ba0c1c932d624360a5473df20d32b300fc76f2ba4aa2a97e1f275c9fd494a1ba9f07c4cb2ad7ceaeb1ae97  mpc-1.3.1.tar.gz
"

prepare() {
    ./configure \
        --prefix=/usr \
        --enable-thread-safe
}

compile() {
    make
}

install() {
    make install
}


