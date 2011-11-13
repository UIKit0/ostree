SUMMARY = "NetworkManager"
HOMEPAGE = "http://projects.gnome.org/NetworkManager/"
LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"

DEPENDS = "gnutls wpa-supplicant libnl wireless-tools ppp glib-2.0 dbus-glib util-linux virtual/gettext"

SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/NetworkManager/0.9/NetworkManager-${PV}.tar.bz2 \
           file://0001-configure-Allow-specifying-with-distro-generic.patch \
          "

inherit autotools pkgconfig

EXTRA_OECONF = "--with-distro=generic --with-crypto=gnutls"