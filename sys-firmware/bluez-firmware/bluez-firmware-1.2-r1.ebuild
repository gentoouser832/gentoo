# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Firmware for Broadcom BCM203x and STLC2300 Bluetooth chips"
HOMEPAGE="http://www.bluez.org/"
SRC_URI="http://bluez.sourceforge.net/download/${P}.tar.gz"

RESTRICT="bindist mirror"

LICENSE="bluez-firmware"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~hppa ~ppc ~x86"
IUSE=""

DOCS=( AUTHORS ChangeLog README )

src_configure() {
	econf --libdir=/lib
}

src_compile() {
	:
}
