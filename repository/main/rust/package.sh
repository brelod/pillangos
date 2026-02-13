name=rust
version=latest
urls="
https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-musl/rustup-init
"
sha512sums="
81d65afadf55a8a1507dd7336a7e856d54f2f7a37eb50850d30c066417c0a410d1664a32bcbb44030afd17634ce64e787eb7791fccffcdd2f110a6d2af1735ec  rustup-init
"

extract() {
    mkdir -p rust
    for url in $urls; do
        exe="${url##*/}"
        cp -vf "$exe" rust/
    done
}

prepare() {
    chmod +x rustup-init
}

compile() {
    echo "Skip compilation"
}

install() {
    ./rustup-init -y \
        --verbose \
        --target "$TARGET" \
        --default-host "$TARGET" \
        --default-toolchain "stable-$TARGET"

    rm -rf /root/.rustup/toolchains/stable-x86_64-unknown-linux-musl/share/doc
}
