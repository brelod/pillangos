name=musl-obstack
version=1.2.3
urls="
https://github.com/void-linux/musl-obstack/archive/refs/tags/v$version.tar.gz
"

sha512sums="
b2bbed19c4ab2714ca794bdcb1a84fad1af964e884d4f3bbe91c9937ca089d92b8472cb05ebe998a9f5c85cb922b9b458db91eff29077bd099942e1ce18e16cc  ./v1.2.3.tar.gz
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


