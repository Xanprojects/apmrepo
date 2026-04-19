class Dash

homepage "http://gondor.apana.org.au/~herbert/dash/"
url "http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz"
sha256 "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
version "0.5.12"

define preparation
    run "mkdir -p /opt/apm/package/dash/"
    download https://raw.githubusercontent.com/Xanprojects/apmrepo/refs/heads/main/package/dash/manifest -> /opt/apm/package/dash/manifest
    download url -> dash.tar.gz
    verify sha256 dash.tar.gz
    extract dash.tar.gz -> source
    cd source/dash-0.5.12

define build
    run "./configure"
    run "make"

define install
    run "make install DESTDIR=/opt/apm"
    run "mkdir -p /opt/apm/bin"
    run "cp src/dash /opt/apm/bin/dash"
