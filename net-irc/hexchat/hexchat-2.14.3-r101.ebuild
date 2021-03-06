# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LUA_COMPAT=( lua5-{1..4} luajit )
PYTHON_COMPAT=( python3_{7..9} )

inherit lua-single meson mono-env python-single-r1 xdg

DESCRIPTION="Graphical IRC client based on XChat"
HOMEPAGE="https://hexchat.github.io/"

if [[ "${PV}" == "9999" ]] ; then
	inherit git-r3
	SRC_URI=""
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
else
	SRC_URI="https://dl.hexchat.net/${PN}/${P}.tar.xz
		https://github.com/hexchat/hexchat/commit/a25f2381689d2c2279a0e43b33f6c0ec8305a096.patch -> ${PN}-add-libera-chat.patch
		https://github.com/hexchat/hexchat/commit/d3545f37cd5f551ed8bc0ab7b20e5c8140adc0a6.patch -> ${PN}-default-network.patch"
	KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~ia64 ppc ppc64 sparc x86 ~amd64-linux"
fi

LICENSE="GPL-2 plugin-fishlim? ( MIT )"
SLOT="0"
IUSE="dbus debug +gtk libcanberra libnotify libproxy lua perl plugin-checksum plugin-fishlim plugin-sysinfo python ssl theme-manager"
REQUIRED_USE="lua? ( ${LUA_REQUIRED_USE} )
	python? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	dev-libs/glib:2
	dbus? ( dev-libs/dbus-glib )
	gtk? (
		x11-libs/gdk-pixbuf:2
		x11-libs/gtk+:2
		x11-libs/libX11
		x11-libs/pango
	)
	libcanberra? ( media-libs/libcanberra )
	libproxy? ( net-libs/libproxy )
	libnotify? ( x11-libs/libnotify )
	lua? ( ${LUA_DEPS} )
	perl? ( dev-lang/perl:= )
	plugin-sysinfo? ( sys-apps/pciutils )
	python? ( ${PYTHON_DEPS} )
	ssl? ( dev-libs/openssl:0= )
	theme-manager? (
		|| (
			( dev-lang/mono[minimal] dev-dotnet/libgdiplus )
			dev-lang/mono[-minimal]
		)
	)"

DEPEND="${RDEPEND}"
BDEPEND="
	dev-util/glib-utils
	app-arch/xz-utils
	app-text/iso-codes
	sys-devel/gettext
	virtual/pkgconfig
"

PATCHES=(
	"${FILESDIR}/${P}-python38.patch" #758758
	"${DISTDIR}/${PN}-add-libera-chat.patch"
	"${DISTDIR}/${PN}-default-network.patch"
)

pkg_setup() {
	use lua && lua-single_pkg_setup
	use python && python-single-r1_pkg_setup
	if use theme-manager ; then
		mono-env_pkg_setup
		export XDG_CACHE_HOME="${T}/.cache"
	fi
}

src_configure() {
	local emesonargs=(
		-Dwith-gtk="$(usex gtk true false)"
		-Dwith-text="$(usex gtk false true)"
		-Dwith-ssl="$(usex ssl true false)"
		-Dwith-plugin=true
		-Dwith-dbus="$(usex dbus true false)"
		-Dwith-libproxy="$(usex libproxy true false)"
		-Dwith-libnotify="$(usex libnotify true false)"
		-Dwith-libcanberra="$(usex libcanberra true false)"
		-Dwith-theme-manager="$(usex theme-manager true false)"
		-Ddbus-service-use-appid=false
		-Dwith-checksum="$(usex plugin-checksum true false)"
		-Dwith-fishlim="$(usex plugin-fishlim true false)"
		-Dwith-lua="$(usex lua "${ELUA}" false)"
		-Dwith-perl="$(usex perl "${EPREFIX}"/usr/bin/perl false)"
		-Dwith-python="$(usex python "${EPYTHON/.*}" false)"
		-Dwith-sysinfo="$(usex plugin-sysinfo true false)"
		-Dwith-appdata=false
	)
	meson_src_configure
}

src_install() {
	meson_src_install
	dodoc readme.md
	find "${ED}" -name '*.la' -delete || die
}

pkg_preinst() {
	if use gtk ; then
		xdg_pkg_preinst
	fi
}

pkg_postinst() {
	if use gtk ; then
		xdg_pkg_postinst
	else
		elog "You have disabled the gtk USE flag. This means you don't have"
		elog "the GTK-GUI for HexChat but only a text interface called \"hexchat-text\"."
	fi

	if use theme-manager ; then
		elog "Themes are available at:"
		elog "  https://hexchat.github.io/themes.html"
	fi

	elog
	elog "optional dependencies:"
	elog "  media-sound/sox (sound playback if you don't have libcanberra"
	elog "    enabled)"
	elog "  x11-themes/sound-theme-freedesktop (default BEEP sound,"
	elog "    needs libcanberra enabled)"
}

pkg_postrm() {
	if use gtk ; then
		xdg_pkg_postrm
	fi
}
