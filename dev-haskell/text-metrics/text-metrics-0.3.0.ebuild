# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.5.9999
#hackport: flags: -dev

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Calculate various string metrics efficiently"
HOMEPAGE="https://github.com/mrkkrp/text-metrics"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # does not pass tests on non-ascii symbols

RDEPEND=">=dev-haskell/text-0.2:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/vector-0.11:=[profile?] <dev-haskell/vector-0.13:=[profile?]
	>=dev-lang/ghc-7.10.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.22.2.0
	test? ( >=dev-haskell/hspec-2.0 <dev-haskell/hspec-3.0
		>=dev-haskell/quickcheck-2.8 <dev-haskell/quickcheck-3.0 )
"

src_prepare() {
	default

	cabal_chdeps \
		'containers       >= 0.5.6.2 && < 0.6' 'containers       >= 0.5.6.2'
}

src_configure() {
	haskell-cabal_src_configure \
		--flag=-dev
}
