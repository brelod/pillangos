name=busybox
version=1.36.1
urls="
https://busybox.net/downloads/busybox-$version.tar.bz2
"
sha512sums="
8c0c754c9ae04b5e6b23596283a7d3a4ef96225fe179f92d6f6a99c69c0caa95b1aa56c267f52d7c807f6cc69e1f0b7dd29a8ac624098f601738f8c0c57980d4  busybox-1.36.1.tar.bz2
"

prepare() {
    make defconfig
    # The code of TC is not supported by the new kernel --> disable it
    sed 's/CONFIG_TC=y/CONFIG_TC=n/' -i .config
}

compile() {
    make
}

install() {
    cp busybox "/usr/bin/"
    /usr/bin/busybox --install -s
}


