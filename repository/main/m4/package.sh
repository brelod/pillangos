name=m4
version=1.4.19
urls="
https://ftp.gnu.org/pub/gnu/m4/m4-$version.tar.xz
"
sha512sums="
47f595845c89709727bda0b3fc78e3188ef78ec818965b395532e7041cabe9e49677ee4aca3d042930095a7f8df81de3da1026b23b6897be471f6cf13ddd512b  m4-1.4.19.tar.xz
"

prepare() {
    ./configure \
        --prefix=/usr

    # Disable makeinfo
    sed -e 's|^MAKEINFO =*|MAKEINFO = true|g' -i Makefile
}

compile() {
    make
}

install() {
    make install
}

