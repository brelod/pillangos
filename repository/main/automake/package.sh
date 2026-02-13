name=automake
version=1.16
urls="
https://ftp.gnu.org/pub/gnu/automake/automake-$version.tar.xz
"

sha512sums="
5ed8bed7cf823b1a1ea9090c81d2ec8affa516697ba109929ffca8724d25f13228fcaa3b5490f275c34fb4b523df423e32f900795bd6c51964703c91d1fe1ac9  automake-1.16.tar.xz
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


