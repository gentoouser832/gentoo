# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )
PYTHON_REQ_USE="xml(+)"

inherit distutils-r1

DESCRIPTION="A python SVG charts generator"
HOMEPAGE="https://github.com/Kozea/pygal/"
SRC_URI="https://github.com/Kozea/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	media-gfx/cairosvg[${PYTHON_USEDEP}]"

BDEPEND="
	test? ( dev-python/pyquery[${PYTHON_USEDEP}] )"

# CHANGELOG is a symlink to docs/changelog.rst
DOCS=( docs/changelog.rst README.md )

distutils_enable_sphinx docs
distutils_enable_tests pytest

python_prepare_all() {
	# Not actually required unless we want to do setup.py test
	# https://github.com/Kozea/pygal/issues/430
	sed -i -e "/setup_requires/d" setup.py || die
	distutils-r1_python_prepare_all
}
