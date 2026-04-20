class Dash

homepage "http://gondor.apana.org.au/~herbert/dash/"
url "http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz"
sha256 "6a474ac46e8b0b32916c4c60df694c82058d3297d8b385b74508030ca4a8f28a"
version "0.5.12"

define preparation
    run "mkdir -p /opt/apm/package/dash/"
    download url -> dash.tar.gz
    verify sha256 dash.tar.gz
    extract dash.tar.gz -> source
    cd source/dash-0.5.12

define build
    run "./configure > /dev/null 2>&1"
    run "make > /dev/null 2>&1"

define install
    # 🔴 install 前記錄檔案
    run "find /opt/apm -type f | sort > /tmp/apm_before.txt"

    run "make install DESTDIR=/opt/apm > /dev/null 2>&1"
    run "mkdir -p /opt/apm/bin"
    run "cp src/dash /opt/apm/bin/dash"

    # 🔴 install 後記錄檔案
    run "find /opt/apm -type f | sort > /tmp/apm_after.txt"

    # 🔴 diff 出新增檔案 = manifest
    run "comm -13 /tmp/apm_before.txt /tmp/apm_after.txt > /opt/apm/package/dash/manifest"
