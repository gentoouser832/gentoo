# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Testing utilities for gRPC Python"
HOMEPAGE="https://grpc.io"
SRC_URI="mirror://pypi/${PN::1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc64 ~x86"

RDEPEND="
	~dev-python/grpcio-${PV}[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]
"
BDEPEND="${RDEPEND}"
