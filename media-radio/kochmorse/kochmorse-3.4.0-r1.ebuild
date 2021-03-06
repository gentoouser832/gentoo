# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Morse-code tutor using the Koch method"
HOMEPAGE="https://github.com/hmatuschek/kochmorse"
SRC_URI="https://github.com/hmatuschek/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

BDEPEND="dev-qt/linguist-tools:5"
RDEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtmultimedia:5
	dev-qt/qtwidgets:5"
DEPEND="${RDEPEND}"

src_prepare() {
	cmake_src_prepare
	# Upstream uses a non-standard category in release 3.4.0
	sed -i -e 's/Teaching;/X-Teaching;/' shared/${PN}.desktop || die
}
