# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit linux-info python-any-r1 scons-utils toolchain-funcs systemd udev

DESCRIPTION="Userspace Xbox 360 Controller driver"
HOMEPAGE="https://xboxdrv.gitlab.io"
SRC_URI="https://gitlab.com/xboxdrv/xboxdrv/-/archive/v0.8.8/xboxdrv-v0.8.8.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-libs/boost:=
	dev-libs/dbus-glib
	dev-libs/glib:2
	sys-apps/dbus
	virtual/libudev:=
	virtual/libusb:1
	x11-libs/libX11
"

DEPEND="
	${RDEPEND}
"

BDEPEND="
	dev-util/glib-utils
	virtual/pkgconfig
"

S="${WORKDIR}/xboxdrv-v0.8.8"

PATCHES=( "${FILESDIR}/"xboxdrv-0.8.8-some-boost-fix.patch
	"${FILESDIR}/"xboxdrv-0.8.8-Update-SConstruct-to-python3.patch
	"${FILESDIR}/"xboxdrv-0.8.8-Updating-python-code-to-python3.patch )

CONFIG_CHECK="~INPUT_EVDEV ~INPUT_JOYDEV ~INPUT_UINPUT ~!JOYSTICK_XPAD"

pkg_setup() {
	linux-info_pkg_setup
	python_setup
}

src_compile() {
	escons \
		BUILD=custom \
		CXX="$(tc-getCXX)" \
		AR="$(tc-getAR)" \
		RANLIB="$(tc-getRANLIB)" \
		CXXFLAGS="-Wall ${CXXFLAGS}" \
		LINKFLAGS="${LDFLAGS}"
}

src_install() {
	dobin xboxdrv
	doman doc/xboxdrv.1
	dodoc AUTHORS NEWS PROTOCOL README.md TODO

	newinitd "${FILESDIR}"/xboxdrv.initd xboxdrv
	newconfd "${FILESDIR}"/xboxdrv.confd xboxdrv

	insinto /etc/dbus-1/system.d
	doins "${FILESDIR}"/org.seul.Xboxdrv.conf

	udev_newrules "${FILESDIR}"/xboxdrv.udev-rules 99-xbox-controller.rules
	systemd_dounit "${FILESDIR}"/xboxdrv.service
}

pkg_postinst() {
	udev_reload
}
