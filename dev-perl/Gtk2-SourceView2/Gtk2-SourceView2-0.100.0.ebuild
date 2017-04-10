# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DIST_AUTHOR=POTYL
DIST_VERSION=0.10
DIST_A_EXT=tar.gz
inherit perl-module

DESCRIPTION="Perl binding for the C library gtksourceview"

SLOT="0"
LICENSE="|| ( GPL-2+  Artistic-2 )"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-perl/gtk2-perl
	>=dev-perl/glib-perl-1.160.0
"
DEPEND="${RDEPEND}
	dev-perl/ExtUtils-Depends
	dev-perl/ExtUtils-PkgConfig
	virtual/perl-ExtUtils-MakeMaker
	x11-libs/gtksourceview:2.0
"
