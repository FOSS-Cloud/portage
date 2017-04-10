# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A performance data analyzer for nagios"
HOMEPAGE="http://www.pnp4nagios.org/"
SRC_URI="mirror://sourceforge/${PN}/PNP-0.6/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE="apache2"
KEYWORDS="~amd64 ~ppc ~ppc64 ~sparc ~x86"

# A lot of things (sync mode, for one) are broken with nagios-4.x.
DEPEND="
	dev-lang/php:*[filter,gd,json,simplexml,xml,zlib]
	>=net-analyzer/rrdtool-1.2[graph,perl]
	|| ( <net-analyzer/nagios-core-4 net-analyzer/icinga net-analyzer/icinga2 )"

# A list of modules used in our Apache config file.
APACHE_MODS="apache2_modules_alias,"       # "Alias" directive
APACHE_MODS+="apache2_modules_authz_core," # "Require" directive
APACHE_MODS+="apache2_modules_rewrite"     # "RewriteEngine" and friends

RDEPEND="${DEPEND}
	virtual/perl-Getopt-Long
	virtual/perl-Time-HiRes
	media-fonts/dejavu
	apache2? ( >=www-servers/apache-2.4[${APACHE_MODS}] )"

PATCHES=(
	"${FILESDIR}/${PN}-0.6.14-makefile.patch"
	"${FILESDIR}/${P}-rrdtool-0.6.0-support.patch"
)

src_configure() {
	local var_dir user_group

	if has_version net-analyzer/nagios-core; then
		var_dir=/var/nagios
		user_group=nagios
	elif has_version net-analyzer/icinga2; then
		var_dir=/var/lib/icinga2
		user_group=icinga
	else
		var_dir=/var/lib/icinga
		user_group=icinga
	fi

	econf \
		--sysconfdir="${EPREFIX}"/etc/pnp \
		--datarootdir="${EPREFIX}"/usr/share/pnp \
		--with-perfdata-dir="${EPREFIX}"${var_dir}/perfdata \
		--with-nagios-user=${user_group} \
		--with-nagios-group=${user_group} \
		--with-perfdata-logfile="${EPREFIX}"${var_dir}/perfdata.log \
		--with-perfdata-spool-dir="${EPREFIX}"/var/spool/pnp
}

src_compile() {
	# The default target just shows a help
	emake all
}

src_install() {
	emake DESTDIR="${D}" install install-config
	einstalldocs
	newinitd "${FILESDIR}"/npcd.initd npcd
	rm "${ED%/}/usr/share/pnp/install.php" || \
		die "unable to remove ${ED%/}/usr/share/pnp/install.php"

	if use apache2 ; then
		insinto "${APACHE_MODULES_CONFDIR}"
		newins "${FILESDIR}"/98_pnp4nagios-2.4.conf 98_pnp4nagios.conf

		# Allow the apache user to read our config files. This same
		# approach is used in net-analyzer/nagios-core.
		chgrp -R apache "${ED%/}/etc/pnp" \
			|| die "failed to change group of ${ED%/}/etc/pnp"
	fi

	# Bug 430358 - CVE-2012-3457
	local f
	while IFS="" read -d $'\0' -r f ; do
		chmod 0640 "${f}" || die
	done < <(find "${ED%/}/etc/pnp" -type f)

	while IFS="" read -d $'\0' -r f ; do
		chmod 0750 "${f}" || die
	done < <(find "${ED%/}/etc/pnp" -type d)
}

pkg_postinst() {
	elog "To enable the pnp4nagios web front-end, please visit"
	elog "${EROOT%/}/etc/conf.d/apache2 and add \"-D PNP -D PHP5\""
	elog "to APACHE2_OPTS. Then pnp4nagios will be available at,"
	elog
	elog "  http://localhost/pnp4nagios"
	elog
}
