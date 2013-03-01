# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kate/kate-4.10.0.ebuild,v 1.2 2013/02/23 16:04:57 ago Exp $

EAPI=5

KDE_HANDBOOK="optional"
KMNAME="kate"
PYTHON_DEPEND="pate? 2"
inherit python kde4-meta

DESCRIPTION="Kate is an MDI texteditor."
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
IUSE="debug pate +plasma"

DEPEND="
	dev-libs/libxml2
	dev-libs/libxslt
	pate? ( $(add_kdebase_dep pykde4 '' 4.9.2-r1) )
"
RDEPEND="${DEPEND}
	$(add_kdebase_dep katepart)
"

pkg_setup() {
	if use pate; then
		python_set_active_version 2
		python_pkg_setup
	fi
	kde4-meta_pkg_setup
}

src_configure() {
	mycmakeargs=(
		$(cmake-utils_use_build pate)
		$(cmake-utils_use_with plasma)
	)

	kde4-meta_src_configure
}

pkg_postinst() {
	kde4-meta_pkg_postinst

	if ! has_version kde-base/kaddressbook:${SLOT}; then
		echo
		elog "File templates plugin requires kde-base/kaddressbook:${SLOT}."
		elog "Please install it if you plan to use this plugin."
		echo
	fi
}