# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Electronic Schematic and PCB design tools project templates"
HOMEPAGE="https://github.com/kicad/kicad-templates"
SRC_URI="https://gitlab.com/kicad/libraries/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="CC-BY-SA-4.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND=">=sci-electronics/kicad-5.1.0"
