# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8,9} )
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="An open source ecosystem for IoT development"
HOMEPAGE="https://platformio.org/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	$(python_gen_cond_dep '
		<dev-python/bottle-0.13[${PYTHON_USEDEP}]
		>=dev-python/click-5[${PYTHON_USEDEP}]
		<dev-python/click-8[${PYTHON_USEDEP}]
		dev-python/colorama[${PYTHON_USEDEP}]
		>=dev-python/pyserial-3[${PYTHON_USEDEP}]
		<dev-python/pyserial-4[${PYTHON_USEDEP}]
		>=dev-python/requests-2.4[${PYTHON_USEDEP}]
		<dev-python/requests-3[${PYTHON_USEDEP}]
		>=dev-python/semantic_version-2.8.1[${PYTHON_USEDEP}]
		<dev-python/semantic_version-3[${PYTHON_USEDEP}]
		>=dev-python/tabulate-0.8.3[${PYTHON_USEDEP}]
		<dev-python/tabulate-1[${PYTHON_USEDEP}]
		>=dev-python/pyelftools-0.25[${PYTHON_USEDEP}]
		<dev-python/pyelftools-1[${PYTHON_USEDEP}]
		>=dev-python/marshmallow-2.20.5[${PYTHON_USEDEP}]
	')"
