# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

USE_PHP="php7-3 php7-4 php8-0 php8-1"
MY_P="${PN/pecl-/}-${PV/_rc/RC}"
PHP_EXT_S="${WORKDIR}/${MY_P}"
PHP_EXT_PECL_FILENAME="${MY_P}.tgz"

inherit php-ext-pecl-r3

KEYWORDS="~amd64 ~x86"

DESCRIPTION="PHP Bindings for AMQP 0-9-1 compatible brokers"
LICENSE="PHP-3.01"
SLOT="0"
IUSE=""

S="${PHP_EXT_S}"

# Tests require running rabbitmq-server on localhost which requires epmd
# which only accepts /var/run/epmd.pid as pidfile.
RESTRICT="test"

BDEPEND="virtual/pkgconfig"
RDEPEND=">=net-libs/rabbitmq-c-0.5.2:=[ssl]"
DEPEND="${RDEPEND}"
PHP_EXT_ECONF_ARGS=()
