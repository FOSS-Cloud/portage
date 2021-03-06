# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DIST_AUTHOR=PLICEASE
DIST_VERSION=1.21
inherit perl-module

DESCRIPTION="Perl module implementing 'which' internally"

SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~x86 ~ppc-aix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="test +pwhich"

# Was part of File::Which, but depends on File::Which
# so this keeps legacy integrity in place.
PDEPEND="pwhich? ( dev-perl/App-pwhich )"
RDEPEND=""
DEPEND="
	virtual/perl-ExtUtils-MakeMaker
	test? ( >=virtual/perl-Test-Simple-0.470.0 )
"
