# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit toolchain-funcs

DESCRIPTION="A threaded NNTP and spool based UseNet newsreader"
HOMEPAGE="http://www.tin.org/"
SRC_URI="ftp://ftp.tin.org/pub/news/clients/tin/stable/${P}.tar.xz"

LICENSE="BSD GPL-2+"
SLOT="0"
KEYWORDS="amd64 arm ppc x86 ~amd64-linux ~x86-linux ~ppc-macos"
IUSE="cancel-locks debug doc +etiquette gpg idn ipv6 mime nls sasl socks5 spell unicode"

BDEPEND="virtual/pkgconfig"
RDEPEND="
	dev-libs/libpcre
	dev-libs/uulib
	sys-libs/ncurses:=[unicode(+)?]
	gpg? ( app-crypt/gnupg )
	idn? ( net-dns/libidn )
	mime? ( net-mail/metamail )
	nls? ( sys-devel/gettext )
	sasl? ( virtual/gsasl )
	socks5? ( net-proxy/dante )
	unicode? ( dev-libs/icu:= )"
DEPEND="${RDEPEND}"

src_configure() {
	local screen="ncurses"
	use unicode && screen="ncursesw"

	tc-export AR CC RANLIB

	econf \
		$(use_enable cancel-locks) \
		$(use_enable debug) \
		$(use_enable etiquette) \
		$(use_enable gpg pgp-gpg) \
		$(use_enable ipv6) \
		$(use_enable nls) \
		$(use_with mime metamail /usr) \
		$(use_with socks5 socks) $(use_with socks5) \
		$(use_with spell ispell /usr) \
		--disable-mime-strict-charset \
		--enable-echo \
		--enable-nntp-only \
		--enable-prototypes \
		--with-coffee  \
		--with-nntp-default-server="${TIN_DEFAULT_SERVER:-${NNTPSERVER:-news.gmane.org}}" \
		--with-pcre=/usr \
		--with-screen=${screen}
}

src_compile() {
	# To build from the root dir you have to call `make build`, not just
	# `make`.
	emake build
}

src_install() {
	default

	# File collision?
	rm -f "${ED}"/usr/share/man/man5/{mbox,mmdf}.5

	dodoc doc/{CHANGES{,.old},CREDITS,TODO,WHATSNEW}
	use doc && dodoc doc/{*.sample,*.txt}

	insinto /etc/tin
	doins doc/tin.defaults
}
