# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# ebuild generated by hackport 0.5.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="For creating, comparing, parsing and printing Universally Unique Identifiers"
HOMEPAGE="https://github.com/hvr/uuid"
SRC_URI="https://hackage.haskell.org/package/${P}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/cryptohash-md5-0.11.100:=[profile?] <dev-haskell/cryptohash-md5-0.12:=[profile?]
	>=dev-haskell/cryptohash-sha1-0.11.100:=[profile?] <dev-haskell/cryptohash-sha1-0.12:=[profile?]
	>=dev-haskell/entropy-0.3.7:=[profile?]
	>=dev-haskell/network-info-0.2:=[profile?] <dev-haskell/network-info-0.3:=[profile?]
	>=dev-haskell/random-1.0.1:=[profile?] <dev-haskell/random-1.2:=[profile?]
	>=dev-haskell/text-1:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/uuid-types-1.0.2:=[profile?] <dev-haskell/uuid-types-2:=[profile?]
	>=dev-lang/ghc-7.6.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.16.0
	test? ( >=dev-haskell/hunit-1.2
		>=dev-haskell/quickcheck-2.4
		>=dev-haskell/tasty-0.10
		>=dev-haskell/tasty-hunit-0.9
		>=dev-haskell/tasty-quickcheck-0.8 )
"

src_prepare() {
	default

	cabal_chdeps \
		'QuickCheck       >= 2.4   && < 2.10' 'QuickCheck       >= 2.4' \
		'time            >= 1.1      && < 1.8' 'time            >= 1.1' \
		'tasty            >= 0.10  && < 0.12' 'tasty            >= 0.10' \
		'tasty-hunit      == 0.9.*' 'tasty-hunit      >= 0.9' \
		'tasty-quickcheck == 0.8.*' 'tasty-quickcheck >= 0.8' \
		'HUnit            >= 1.2   && < 1.4' 'HUnit            >= 1.2' \
		'entropy         >= 0.3.7    && < 0.4' 'entropy         >= 0.3.7'
}
