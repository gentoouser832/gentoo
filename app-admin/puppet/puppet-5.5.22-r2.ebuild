# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby26 ruby27"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_TASK_DOC="doc:all"

RUBY_FAKEGEM_EXTRAINSTALL="locales"

inherit ruby-fakegem systemd tmpfiles

DESCRIPTION="A system automation and configuration management software."
HOMEPAGE="https://puppet.com/"
SRC_URI="https://downloads.puppetlabs.com/puppet/${P}.tar.gz"

LICENSE="Apache-2.0 GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~ppc64 ~x86"
IUSE="augeas diff doc emacs ldap rrdtool selinux shadow sqlite vim-syntax"
RESTRICT="test"

ruby_add_rdepend "
	>=dev-ruby/hiera-3.2.1:0
	=dev-ruby/facter-3*
	>=dev-ruby/fast_gettext-1.1.2:0
	>=dev-ruby/locale-2.1:0
	>=dev-ruby/multi_json-1.10:0
	dev-ruby/sync
	augeas? ( dev-ruby/ruby-augeas )
	diff? ( dev-ruby/diff-lcs )
	doc? ( dev-ruby/rdoc )
	ldap? ( dev-ruby/ruby-ldap )
	shadow? ( dev-ruby/ruby-shadow )
	sqlite? ( dev-ruby/sqlite3 )
	virtual/ruby-ssl
	dev-ruby/hocon"

ruby_add_bdepend "
	doc? ( dev-ruby/yard )
	test? (
		dev-ruby/mocha
		dev-ruby/rack
		dev-ruby/rspec-its
	)"
# this should go in the above lists, but isn't because of test deps not being keyworded
#   dev-ruby/rspec-collection_matchers

RDEPEND+=" ${RDEPEND}
	rrdtool? ( >=net-analyzer/rrdtool-1.2.23[ruby] )
	selinux? (
		sys-libs/libselinux[ruby]
		sec-policy/selinux-puppet
	)
	vim-syntax? ( >=app-vim/puppet-syntax-3.0.1 )
	>=app-portage/eix-0.18.0
	acct-user/puppet
	acct-group/puppet"
PDEPEND="emacs? ( >=app-emacs/puppet-mode-0.3-r1 )"

all_ruby_prepare() {
	# Avoid spec that require unpackaged json-schema.
	rm spec/lib/matchers/json.rb $( grep -Rl matchers/json spec) || die

	# fix systemd path
	eapply -p0 "${FILESDIR}/puppet-systemd.patch"

	# Avoid specs that can only run in the puppet.git repository. This
	# should be narrowed down to the specific specs.
	rm spec/integration/parser/compiler_spec.rb || die

	# Avoid failing spec that need further investigation.
	rm spec/unit/module_tool/metadata_spec.rb || die
}

each_ruby_install() {
	each_fakegem_install
#	dosym "/usr/$(get_libdir)/ruby/gems/$(ruby_get_version)/gems/${P}" "/usr/$(get_libdir)/ruby/gems/$(ruby_get_version)/gems/${PN}"
}

all_ruby_install() {
	all_fakegem_install

	# systemd stuffs
	systemd_dounit "${WORKDIR}/all/${P}/ext/systemd/puppet.service"

	# tmpfiles stuff
	newtmpfiles "${FILESDIR}/tmpfiles.d" "puppet.conf"

	# openrc init stuff
	newinitd "${FILESDIR}"/puppet.init-4.x puppet
	newinitd "${FILESDIR}"/puppetmaster.init-4.x puppetmaster
	newconfd "${FILESDIR}"/puppetmaster.confd puppetmaster

	keepdir /etc/puppetlabs/puppet/ssl

	keepdir /var/lib/puppet/facts
	keepdir /var/lib/puppet/files
	fowners -R puppet:puppet /var/lib/puppet

	fperms 0750 /var/lib/puppet

	fperms 0750 /etc/puppetlabs
	fperms 0750 /etc/puppetlabs/puppet
	fperms 0750 /etc/puppetlabs/puppet/ssl
	fowners -R :puppet /etc/puppetlabs
	fowners -R :puppet /var/lib/puppet

	if use ldap ; then
		insinto /etc/openldap/schema; doins ext/ldap/puppet.schema
	fi

	# ext and examples files
	for f in $(find ext examples -type f) ; do
		docinto "$(dirname ${f})"; dodoc "${f}"
	done
}

pkg_postinst() {
	tmpfiles_process puppet.conf

	elog
	elog "Please, *don't* include the --ask option in EMERGE_EXTRA_OPTS as this could"
	elog "cause puppet to hang while installing packages."
	elog
	elog "Portage Puppet module with Gentoo-specific resources:"
	elog "http://forge.puppetlabs.com/gentoo/portage"
	elog

	for v in ${REPLACING_VERSIONS}; do
		if [ "$(ver_cut 1 "$v")" -eq "4" ]; then
			elog
			elog "Please see the following url for the release notes for puppet-5"
			elog "https://docs.puppet.com/puppet/5.0/release_notes.html#if-youre-upgrading-from-puppet-4x"
			elog
		fi
	done
}
