# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"

inherit eutils vcs-snapshot

DESCRIPTION="cron script to sync portage and send update mails to root"
HOMEPAGE="https://github.com/gentoo/porticron"
SRC_URI="https://github.com/gentoo/porticron/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ppc ~ppc64 ~x86"
IUSE=""

RDEPEND="
	app-portage/gentoolkit
	net-dns/bind-tools
"
DEPEND=""

src_install() {
	dosbin bin/porticron
	insinto /etc
	doins etc/porticron.conf
}
