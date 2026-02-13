name=flex
version=2.6.4
urls="
https://github.com/westes/flex/releases/download/v$version/flex-$version.tar.gz
"
sha512sums="
e9785f3d620a204b7d20222888917dc065c2036cae28667065bf7862dfa1b25235095a12fd04efdbd09bfd17d3452e6b9ef953a8c1137862ff671c97132a082e  flex-2.6.4.tar.gz
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

