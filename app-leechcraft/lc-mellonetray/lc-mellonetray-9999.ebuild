# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit leechcraft

DESCRIPTION="System tray quark for LeechCraft"

SLOT="0"
KEYWORDS=""
IUSE="debug"

DEPEND="~app-leechcraft/lc-core-${PV}
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	dev-qt/qtdeclarative:5
	dev-qt/qtx11extras:5
	x11-libs/libXdamage
	x11-libs/libXrender"
RDEPEND="${DEPEND}
	 ~virtual/leechcraft-quark-sideprovider-${PV}"
