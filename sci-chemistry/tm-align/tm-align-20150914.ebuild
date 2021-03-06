# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils flag-o-matic fortran-2

DESCRIPTION="Quick & Accurate Structural Alignment"
HOMEPAGE="http://zhanglab.ccmb.med.umich.edu/TM-align/"
SRC_URI="http://zhanglab.ccmb.med.umich.edu/TM-align/TMtools${PV}.tar.gz"

LICENSE="tm-align"
SLOT="0"
KEYWORDS="amd64 ~ppc ppc64 x86 ~amd64-linux ~x86-linux"
IUSE="custom-cflags static"

S="${WORKDIR}"

src_prepare() {
	cp "${FILESDIR}"/CMakeLists.txt . || die
	cmake-utils_src_prepare

	use static && append-fflags -static && append-ldflags -static
	# recommended by upstream
	use custom-cflags || replace-flags -O* -O3 && append-fflags -ffast-math
}
