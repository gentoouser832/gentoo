# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop wrapper

DESCRIPTION="Enemy Territory: Quake Wars"
HOMEPAGE="http://zerowing.idsoftware.com/linux/etqw/ETQWFrontPage/"
SRC_URI="http://ftp.jeuxlinux.fr/files/ETQW-client-${PV}-full.x86.run"
S="${WORKDIR}"/data

LICENSE="ETQW"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"
IUSE="cdinstall"
RESTRICT="bindist mirror strip"

RDEPEND="
	>=media-libs/libsdl-1.2.15-r4[video,sound,opengl,abi_x86_32(-)]
	>=media-libs/alsa-lib-1.0.27.2[abi_x86_32(-)]
	sys-libs/glibc
	>=sys-libs/zlib-1.2.8-r1[abi_x86_32(-)]
	>=x11-libs/libX11-1.6.2[abi_x86_32(-)]
	>=x11-libs/libXext-1.3.2[abi_x86_32(-)]
	virtual/jpeg-compat:62[abi_x86_32(-)]
	amd64? ( sys-libs/glibc[multilib] )
	cdinstall? ( games-fps/etqw-data )
"
BDEPEND="app-arch/unzip"

MY_DIR=/opt/etqw

QA_PREBUILT="
	${MY_DIR#/}/*.x86
	${MY_DIR#/}/*.so*
"

src_unpack() {
	tail -c +194885 "${DISTDIR}"/${A} > ${A}.zip
	unpack ./${A}.zip
	rm -f ${A}.zip || die
}

src_install() {
	insinto ${MY_DIR}
	doins -r base pb *.png
	dodoc *.txt

	exeinto ${MY_DIR}
	doexe etqw{,ded,-rthread}.x86 openurl.sh libCgx86.so libSDL*.id.so*

	newicon etqw_icon.png etqw.png
	make_wrapper etqw ./etqw.x86 "${MY_DIR}" "${MY_DIR}"
	make_desktop_entry etqw "Enemy Territory: Quake Wars" etqw

	make_wrapper etqw-dedicated ./etqwded.x86 "${MY_DIR}" "${MY_DIR}"
	make_desktop_entry etqw-dedicated "Enemy Territory: Quake Wars (dedicated server)" etqw

	make_wrapper etqw-rthread ./etqw-rthread.x86 "${MY_DIR}" "${MY_DIR}"
	make_desktop_entry etqw-rthread "Enemy Territory: Quake Wars (SMP)" etqw
}

pkg_postinst() {
	if ! use cdinstall ; then
		elog "You need to copy pak00*.pk4, zpak_*.pk4 and the megatextures"
		elog "directory to ${MY_DIR}/base before running the game."
	fi

	elog "To change the game language from English, add"
	elog "seta sys_lang \"your_language\" to your autoexec.cfg file."
	elog "Menu fonts may not show up until you do so."
}
