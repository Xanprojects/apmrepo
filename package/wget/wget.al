class Wget

homepage "https://www.gnu.org/software/wget/"
url "https://ftp.gnu.org/gnu/wget/wget-1.25.0.tar.gz"
sha256 "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"
version "1.25.0"

define preparation
    run "mkdir -p /opt/apm/package/wget/"
    download url -> wget.tar.gz
    verify sha256 wget.tar.gz
    extract wget.tar.gz -> source
    cd source/wget-1.25.0

define build
    run "./configure"
    run "make"

define install
    # 🔴 install 前記錄檔案
    run "find /opt/apm -type f | sort > /tmp/apm_before.txt"

    run "make install DESTDIR=/opt/apm"
    run "mkdir -p /opt/apm/bin"
    run "cp src/wget /opt/apm/bin/wget"

    # 🔴 install 後記錄檔案
    run "find /opt/apm -type f | sort > /tmp/apm_after.txt"

    # 🔴 diff 出新增檔案 = manifest
    run "comm -13 /tmp/apm_before.txt /tmp/apm_after.txt > /opt/apm/package/wget/manifest"
