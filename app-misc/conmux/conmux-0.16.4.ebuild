# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit perl-module

DIST_TEST="skip"

MY_PN="autotest"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A console multiplexor"
HOMEPAGE="https://github.com/autotest/autotest"
SRC_URI="https://github.com/autotest/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~mips ~x86"

RDEPEND="dev-perl/IO-Multiplex
	dev-perl/URI"

PATCHES=(
	"${FILESDIR}"/${PN}-0.16.4_unexpected-paths.patch
)

S="${WORKDIR}"/${MY_P}/conmux

src_prepare() {
	default
	# manual installation of drivers and helpers
	sed -i -e "/include/d" Makefile || die "Failed to fix Makefile"
}

src_install() {
	perl_set_version
	emake BASE="${ED}/usr" install
	# helpers and drivers have been removed in src_prepare
	insinto /usr/share/${PN}/
	doins -r drivers/  helpers/
	fperms -R 0750 /usr/share/${PN}/{drivers,helpers}/
	keepdir /etc/${PN}
	# no need to have the init script in /sbin
	rm "${ED}"/usr/sbin/start || die "failed to remove init script"
	# console is too generic. Make it conmux-console instead
	mv "${ED}"/usr/bin/console "${ED}"/usr/bin/${PN}-console || \
		die "failed to rename console to conmux-console"
	# Fix up directory for the module
	perl_set_version
	keepdir ${VENDOR_LIB}/${PN}
	mv "${ED}"/usr/lib/Conmux.pm "${ED}"/${VENDOR_LIB}/. || \
		die "failed to move the Conmux.pm module"
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newinitd "${FILESDIR}"/${PN}-registry.initd ${PN}-registry
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	newconfd "${FILESDIR}"/${PN}-registry.confd ${PN}-registry
	dodoc README
}

pkg_postinst() {
	elog
	elog "If you have more than one serial ports and you want to use all"
	elog "of them with conmux, copy and paste the 'conmux' init.d and conf.d"
	elog "files as many times as you want, pointing each conf.d file to the"
	elog "device's configuration file."
	elog
	elog "See /etc/conf.d/conmux for more information"
	elog
}
