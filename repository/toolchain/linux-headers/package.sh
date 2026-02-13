name=linux-headers
version=6.9
urls="
https://mirrors.edge.kernel.org/pub/linux/kernel/v6.x/linux-$version.tar.xz
"

sha512sums="
fed3b4cd1fbfb4d94618587c1934273d2ecc8b6e42a3d586ff8a5f24980be930f2ef803aa2923ca3bfa5e4e619f967f3af315368f24fa76f610b10443624a579  linux-6.9.tar.xz
"

prepare() {
    make mrproper
}

compile() {
    make headers
    find usr/include -type f ! -name '*.h' -delete
}

install() {
    cp -rfv usr/include "$SYSROOT/usr/"
}

