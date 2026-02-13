name=autoconf
version=2.72
urls="
https://ftp.gnu.org/pub/gnu/autoconf/autoconf-$version.tar.xz
"

sha512sums="
c4e9fbd858666d3e5c3b4fe7f89aa3e8e3a0a00dc7e166f8147d937d911b77ba3ac6a016f9d223ccdd830bc8960b3e60397c0607cc6a1fd2c50c7492839ddd17  autoconf-2.72.tar.xz
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

