# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_BLOCK_SLOT4=false
KMNAME="kdegraphics-thumbnailers"
inherit kde5

DESCRIPTION="Thumbnail generators for PDF/PS and RAW files"
LICENSE="GPL-2+"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	$(add_frameworks_dep kio)
	$(add_kdeapps_dep libkdcraw)
	$(add_kdeapps_dep libkexiv2)
	$(add_qt_dep qtgui)
"
RDEPEND="${DEPEND}"
