# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Rules for polkit to add compatibility with pklocalauthority"
HOMEPAGE="https://pagure.io/polkit-pkla-compat"
SRC_URI="https://releases.pagure.org/${PN}/${P}.tar.xz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm ~ppc x86"

RDEPEND=">=dev-libs/glib-2.30
	>=sys-auth/polkit-0.110"
DEPEND="${RDEPEND}"
BDEPEND="
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
	virtual/pkgconfig"

src_install() {
	default
	fowners -R root:polkitd /etc/polkit-1/localauthority
}

pkg_postinst() {
	chown -R root:polkitd "${EROOT}"/etc/polkit-1/localauthority || die
}
