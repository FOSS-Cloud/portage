# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4
inherit eutils user

MY_P="${P/_/-}"
DESCRIPTION="High-performance interface between the MTA and content checkers"
HOMEPAGE="http://www.ijs.si/software/amavisd/"
SRC_URI="http://www.ijs.si/software/amavisd/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 hppa ~ppc ~ppc64 sparc x86"
IUSE="courier dkim ldap mysql postgres qmail razor snmp spamassassin"

DEPEND=">=sys-apps/sed-4
	>=dev-lang/perl-5.8.2"

RDEPEND="${DEPEND}
	>=sys-apps/coreutils-5.0-r3
	app-arch/cpio
	app-arch/gzip
	app-arch/bzip2
	app-arch/arc
	app-arch/cabextract
	app-arch/freeze
	app-arch/lha
	app-arch/ncompress
	app-arch/pax
	app-arch/unarj
	app-arch/xz-utils
	|| ( app-arch/unrar app-arch/rar )
	app-arch/zoo
	>=dev-perl/Archive-Zip-1.14
	>=virtual/perl-IO-Compress-1.35
	>=virtual/perl-Compress-Raw-Zlib-2.017
	dev-perl/Convert-TNEF
	>=dev-perl/Convert-UUlib-1.08
	virtual/perl-MIME-Base64
	>=dev-perl/MIME-tools-5.415
	>=dev-perl/MailTools-1.58
	>=dev-perl/Net-Server-0.91
	virtual/perl-Digest-MD5
	dev-perl/IO-stringy
	>=virtual/perl-Time-HiRes-1.49
	dev-perl/Unix-Syslog
	sys-apps/file
	>=sys-libs/db-4.4.20
	dev-perl/BerkeleyDB
	dev-perl/Convert-BinHex
	>=dev-perl/Mail-DKIM-0.31
	virtual/mta
	ldap? ( >=dev-perl/perl-ldap-0.33 )
	mysql? ( dev-perl/DBD-mysql )
	postgres? ( dev-perl/DBD-Pg )
	razor? ( mail-filter/razor )
	snmp? ( net-analyzer/net-snmp[perl] )
	spamassassin? ( mail-filter/spamassassin )"

AMAVIS_ROOT="/var/amavis"
S="${WORKDIR}/${MY_P}"

src_prepare() {
	if use courier ; then
		epatch amavisd-new-courier.patch
	fi

	if use qmail ; then
		epatch amavisd-new-qmqpqq.patch
	fi

	sed -i  \
		-e '/daemon/s/vscan/amavis/' \
		-e "s:'/var/virusmails':\"\$MYHOME/quarantine\":" \
		"${S}/amavisd.conf" || die "missing conf file"

	if ! use dkim ; then
		sed -i -e '/enable_dkim/s/1/0/' "${S}/amavisd.conf" \
			|| die "missing conf file"
	fi
}

src_install() {
	dosbin amavisd amavisd-agent amavisd-nanny amavisd-release \
		amavisd-signer
	dobin p0f-analyzer.pl amavisd-submit

	if use snmp ; then
		dosbin amavisd-snmp-subagent
		dodoc AMAVIS-MIB.txt
	fi

	insinto /etc
	insopts -m0640
	doins amavisd.conf

	newinitd "${FILESDIR}/amavisd.initd" amavisd

	keepdir "${AMAVIS_ROOT}"
	keepdir "${AMAVIS_ROOT}/db"
	keepdir "${AMAVIS_ROOT}/quarantine"
	keepdir "${AMAVIS_ROOT}/tmp"
	keepdir "${AMAVIS_ROOT}/var"

	dodoc AAAREADME.first INSTALL MANIFEST RELEASE_NOTES TODO \
		amavisd.conf-default amavisd-custom.conf

	docinto README_FILES
	dodoc README_FILES/README*
	dohtml README_FILES/*.{html,css}
	docinto README_FILES/images
	dodoc README_FILES/images/*.png
	docinto README_FILES/images/callouts
	dodoc README_FILES/images/callouts/*.png

	docinto test-messages
	dodoc test-messages/README
	dodoc test-messages/sample.tar.gz.compl

	#for i in whitelist blacklist spam_lovers; do
	#	if [ -f ${AMAVIS_ROOT}/${i} ]; then
	#		cp "${AMAVIS_ROOT}/${i}" "${D}/${AMAVIS_ROOT}"
	#	else
	#		touch "${D}"/${AMAVIS_ROOT}/${i}
	#	fi
	#done

	if use ldap ; then
		dodir /etc/openldap/schema
		insinto /etc/openldap/schema
		insopts -o root -g root -m 644
		newins LDAP.schema ${PN}.schema || die
	fi
}

pkg_preinst() {
	enewgroup amavis
	enewuser amavis -1 -1 "${AMAVIS_ROOT}" amavis
	if use razor ; then
		if [ ! -d "${ROOT}${AMAVIS_ROOT}/.razor" ] ; then
			elog "Setting up initial razor config files..."

			razor-admin -create -home="${D}/${AMAVIS_ROOT}/.razor"
			sed -i -e "s:debuglevel\([ ]*\)= .:debuglevel\1= 0:g" \
				"${D}/${AMAVIS_ROOT}/.razor/razor-agent.conf"
		fi
	fi

	if ! use spamassassin ; then
		elog "Disabling anti-spam code in amavisd.conf..."
		sed -i -e \
			"/^#[[:space:]]*@bypass_spam_checks_maps[[:space:]]*=[[:space:]]*(1)/s/^#//" \
				"${D}/etc/amavisd.conf"
	fi

	if has_version "<${CATEGORY}/${PN}-2.7.0" ; then
		elog "Amavisd-new ships with a short and condensed config file now."
		elog "Transferring your current settings to the new format is"
		elog "recommended for ease of future upgrades."
	fi
}

pkg_postinst() {
	chown root:amavis "${ROOT}/etc/amavisd.conf"
	chown -R amavis:amavis "${ROOT}/${AMAVIS_ROOT}"
}
