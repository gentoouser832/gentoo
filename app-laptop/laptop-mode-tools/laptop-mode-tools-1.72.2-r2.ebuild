# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib systemd tmpfiles udev

MY_P="${PN}_${PV}"

DESCRIPTION="Linux kernel laptop_mode user-space utilities"
HOMEPAGE="https://github.com/rickysarraf/laptop-mode-tools/wiki"
SRC_URI="https://github.com/rickysarraf/${PN}/releases/download/${PV}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ppc x86"
IUSE="+acpi apm bluetooth"

RDEPEND="sys-apps/iproute2
	sys-apps/ethtool
	sys-apps/which
	|| (
		sys-apps/sdparm
		sys-apps/hdparm
	)
	acpi? ( sys-power/acpid )
	apm? ( sys-apps/apmd )
	bluetooth? ( net-wireless/bluez:= )"

PATCHES=(
	"${FILESDIR}/0001-Fix-case-sensitive-name-for-lmt.py.patch"
)

S="${WORKDIR}/${MY_P}"

src_prepare() {
	default
	# This should avoid conflict with pm-powersave wrt #327443 and #396703
	cat <<-EOF > "${T}"/${PN}
	HOOK_BLACKLIST="00powersave"
	EOF
}

src_compile() { :; }

src_install() {
	DESTDIR="${D}" \
		INIT_D="none" \
		MAN_D="/usr/share/man" \
		LIB_D="/usr/$(get_libdir)" \
		UDEV_D="$(get_udevdir)" \
		SYSTEMD_UNIT_D="$(systemd_get_systemunitdir)" \
		TMPFILES_D="/usr/lib/tmpfiles.d" \
		ACPI="$(use acpi && echo force || echo disabled)" \
		PMU="$(false && echo force || echo disabled)" \
		APM="$(use apm && echo force || echo disabled)" \
		SYSTEMD=yes \
		sh ./install.sh || die

	dodoc Documentation/*.txt README.md
	newinitd "${FILESDIR}"/laptop_mode.init-1.4 laptop_mode

	# See src_prepare()
	insinto /etc/pm/config.d
	doins "${T}"/${PN}
}

pkg_postinst() {
	tmpfiles_process laptop-mode.conf

	if use acpi || use apm; then
		if use acpi; then
			daemon_name="acpid"
		elif use apm; then
			deamon_name="apmd"
		fi
		if [ "$(rc-config list default | grep laptop_mode)" = "" ] || [ "$(rc-config list default | grep ${daemon_name} )" = "" ]; then
			ewarn "To enable automatic power state event handling,"
			ewarn "e.g. enabling laptop_mode after unplugging the battery,"
			ewarn "both laptop_mode and the ${daemon_name} daemon must be"
			ewarn "added to default runlevel:"
			if [ "$(rc-config list default | grep laptop_mode)" = "" ]; then
				ewarn "# rc-update add laptop_mode default"
			fi
			if [ "$(rc-config list default | grep ${daemon_name} )" = "" ]; then
				ewarn "# rc-update add ${daemon_name} default"
			fi
		fi
	else
		ewarn "Without USE=\"acpi\" or USE=\"apm\" ${PN} can not"
		ewarn "automatically disable laptop_mode on low battery."
		ewarn
		ewarn "This means you can lose up to 10 minutes of work if running"
		ewarn "out of battery while laptop_mode is enabled."
		ewarn
		ewarn "Please see laptop-mode.txt in /usr/share/doc/${PF} for further"
		ewarn "information."
		ewarn
	fi
}
