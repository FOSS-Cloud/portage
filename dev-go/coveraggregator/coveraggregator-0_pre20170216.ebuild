# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit golang-build golang-vcs-snapshot

KEYWORDS="~amd64"
EGO_PN=github.com/chouquette/${PN}
HOMEPAGE="https://${EGO_PN}"
EGIT_COMMIT="af12d4d73479a1b49a16bbed8e5c182999dd62be"
SRC_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
DESCRIPTION="Cover profile aggregator for golang"
LICENSE="WTFPL-2"
SLOT="0"
IUSE=""
DEPEND="dev-go/go-tools:="
RDEPEND=""

src_install() {
	dobin ${PN}
	dodoc src/${EGO_PN}/README.md
}
