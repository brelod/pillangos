name=file
version=5.45
urls="
https://github.com/file/file/archive/refs/tags/FILE${version/./_}.tar.gz
"
sha512sums="
fdd4c5d13d5ea1d25686c76d8ebc3252c54040c4871e3f0f623c4548b3841795d4e36050292a9453eedf0fbf932573890e9d6ac9fa63ccf577215598ae84b9ea  FILE5_45.tar.gz
"

prepare() {
    autoreconf -fvi
    ./configure \
        --prefix=/usr \
        --enable-static
}

compile() {
    make
}

install() {
    make install
}
