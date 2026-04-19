class Dash

homepage "https://www.freedesktop.org/wiki/Software/pkg-config"
url "https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.tar.gz"
sha256 "c8507705d2a10c67f385d66ca2aae31e81770cc0734b4191eb8c489e864a006b"
version "0.29"

define preparation
    run "mkdir -p /opt/apm/package/pkg-config/"
    download url -> pkg-config.tar.gz
    verify sha256 pkg-config.tar.gz
    extract pkg-config.tar.gz -> source
    cd source/pkg-config-0.29

define build
    run "./configure --with-internal-glib LDFLAGS='-framework CoreFoundation -framework Carbon'"
    run "make"

define install
    # 🔴 install 前記錄檔案
    run "find /opt/apm -type f | sort > /tmp/apm_before.txt"

    run "make install DESTDIR=/opt/apm"
    run "mkdir -p /opt/apm/bin"
    run "cp /opt/apm/usr/local/bin/pkg-config /opt/apm/bin/pkg-config"

    # 🔴 install 後記錄檔案
    run "find /opt/apm -type f | sort > /tmp/apm_after.txt"

    # 🔴 diff 出新增檔案 = manifest
    run "comm -13 /tmp/apm_before.txt /tmp/apm_after.txt > /opt/apm/package/pkg-config/manifest"
