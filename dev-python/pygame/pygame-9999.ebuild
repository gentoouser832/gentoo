# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1 git-r3

DESCRIPTION="Python bindings for SDL multimedia library"
HOMEPAGE="https://www.pygame.org/"
EGIT_REPO_URI="https://github.com/pygame/pygame.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="doc examples midi opengl test X"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/numpy[${PYTHON_USEDEP}]
	>=media-libs/sdl2-image-1.2.2
	>=media-libs/sdl2-mixer-1.2.4
	>=media-libs/sdl2-ttf-2.0.6
	>=media-libs/smpeg2-0.4.4-r1
	midi? ( media-libs/portmidi )
	X? ( >=media-libs/libsdl2-1.2.5[opengl?,threads,video,X] )
	!X? ( >=media-libs/libsdl2-1.2.5[threads] )"
DEPEND="${RDEPEND}
	test? (
		media-libs/sdl2-image[gif,jpeg,png]
		media-libs/sdl2-mixer[mp3,vorbis,wav]
	)"
# fontconfig used for fc-list
RDEPEND+="
	media-libs/fontconfig"
# util-linux provides script
BDEPEND="
	test? (
		media-libs/fontconfig
		sys-apps/util-linux
	)"

python_configure() {
	PORTMIDI_INC_PORTTIME=1 LOCALBASE="${EPREFIX}/usr" \
		"${EPYTHON}" "${S}"/buildconfig/config.py -auto || die

	# Disable automagic dependency on PortMidi.
	if ! use midi; then
		sed -e "s:^pypm :#&:" -i Setup || die "sed failed"
	fi
}

python_test() {
	local -x PYTHONPATH=
	local -x SDL_VIDEODRIVER=dummy
	local -x SDL_AUDIODRIVER=disk
	distutils_install_for_testing
	script -eqc "${EPYTHON} -m pygame.tests" || die
}

python_install() {
	distutils-r1_python_install

	# Bug #497720
	rm -fr "${D}"$(python_get_sitedir)/pygame/{docs,examples,tests}/ || die
}

python_install_all() {
	distutils-r1_python_install_all

	if use doc; then
		docinto html
		dodoc -r docs/*
	fi

	use examples && dodoc -r examples
}
