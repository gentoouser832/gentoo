# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

FORTRAN_NEEDED=fortran
FORTRAN_STANDARD=90

inherit fortran-2

if [ "${PV}" = "9999" ]; then
	EGIT_REPO_URI="https://github.com/lanl/${PN}.git"
	inherit autotools git-r3
else
	SRC_URI="https://lanl.github.io/${PN}/dists/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Run-time tuning of process binding policies made easy"
HOMEPAGE="https://lanl.github.io/libquo/"

LICENSE="BSD"
SLOT="0"
IUSE="fortran static-libs test"
RESTRICT="!test? ( test )"

DEPEND="
	virtual/mpi[fortran?]
	sys-process/numactl
	sys-apps/hwloc:=[numa,xml]
	"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	[[ ${PV} = 9999 ]] && eautoreconf
}

src_configure() {
	econf CC=mpicc FC=$(usex fortran mpif90 false)
}
