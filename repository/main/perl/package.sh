name=perl
version=5.38.2
urls="
https://www.cpan.org/src/5.0/perl-$version.tar.gz
"

sha512sums="
b5101a1278968c7cdb01a8e6c14f0ddd2825e518f4792fa8879c1fa2e5ed4685b1df21216efc657143a9156335036117c3ee05db90f2c38a4ec67a0235fb96b2  perl-5.38.2.tar.gz
"

prepare() {
    sh Configure \
        -des \
        -Dprefix=/usr \
        -Dvendorprefix=/usr \
        -Duseshrplib \
        -Dprivlib=/usr/lib/perl5/5.38/core_perl \
        -Darchlib=/usr/lib/perl5/5.38/core_perl \
        -Dsitelib=/usr/lib/perl5/5.38/site_perl \
        -Dsitearch=/usr/lib/perl5/5.38/site_perl \
        -Dvendorlib=/usr/lib/perl5/5.38/vendor_perl \
        -Dvendorarch=/usr/lib/perl5/5.38/vendor_perl

    patch -p1 < "$PACKAGE_DIR/eff-access.patch"
}

compile() {
    make
}

install() {
    make install
}


