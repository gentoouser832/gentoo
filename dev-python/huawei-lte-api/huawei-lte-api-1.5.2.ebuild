# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3 python3_{8..10} )
inherit distutils-r1

DESCRIPTION="API For huawei LAN/WAN LTE Modems"
HOMEPAGE="https://github.com/Salamek/huawei-lte-api"
SRC_URI="https://github.com/Salamek/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-python/pycryptodome[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]"

python_prepare_all() {
	# make cryptodome-friendly
	find -name '*.py' -exec \
		sed -i -e 's:Cryptodome:Crypto:g' {} + || die

	distutils-r1_python_prepare_all
}

distutils_enable_tests pytest
