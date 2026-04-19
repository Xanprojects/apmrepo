class Dash

homepage "http://gondor.apana.org.au/~herbert/dash/"
url "http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz"
sha256 "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
version "0.5.12"

define preparation
    download url -> dash.tar.gz
    verify sha256 dash.tar.gz
    extract dash.tar.gz -> source

define build
    cd source
    run "./configure"
    run "make"

define install
    cd source
    run "make install DESTDIR=/opt/apm"
    run "mkdir -p /opt/apm/bin"
    run "cp src/dash /opt/apm/bin/dash"
