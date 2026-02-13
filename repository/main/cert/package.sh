name=cert
version=0.0.0
urls=""
sha512sums=""

download() {
    echo "Skip download"
}

extract() {
    [ -e "$BUILD_DIR" ] && rm -rvf "$BUILD_DIR"
    mkdir -p "$BUILD_DIR"
}

prepare() {
    echo "Skip prepare"
}

compile() {
    echo "Skip compile"
}

install() {
    mkdir -p /usr/share/ca-certificates/
    cp -rvf "$PACKAGE_DIR/mozilla" /usr/share/ca-certificates/
    cp -rvf "$PACKAGE_DIR/certs/"* /etc/ssl/certs/
}



