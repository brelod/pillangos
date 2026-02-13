name=bc
version=6.7.5
urls="
https://github.com/gavinhoward/bc/releases/download/$version/bc-$version.tar.xz
"
sha512sums="
5f689fd20801ea7ede725ae5dc4e8744bdf2d72424bffef99c53193a950f4bd83b6eb4c5a07556576d0b3f5b6cd7f9fc7cbcb41d27891f488bb2e97a186f76a4  bc-6.7.5.tar.xz
"

prepare() {
    CC=gcc ./configure --prefix=/usr -G -O3 -r
}

compile() {
    make
}

install() {
    make install
}


