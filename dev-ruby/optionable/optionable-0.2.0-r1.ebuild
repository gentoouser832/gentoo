# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby26 ruby27 ruby30"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

inherit ruby-fakegem

DESCRIPTION="Robust options validation for Ruby methods"
HOMEPAGE="https://github.com/durran/optionable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
