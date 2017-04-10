# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DIST_AUTHOR=PJCJ
DIST_VERSION=1.23
inherit perl-module

DESCRIPTION="Code coverage metrics for Perl"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="minimal test"

RDEPEND="
	virtual/perl-Digest-MD5
	virtual/perl-Storable
	!minimal? (
		dev-perl/Browser-Open
		dev-perl/Capture-Tiny
		dev-perl/Class-XSAccessor
		virtual/perl-JSON-PP
		dev-perl/Moo
		dev-perl/Parallel-Iterator
		>=dev-perl/Pod-Coverage-0.60.0
		>=dev-perl/PPI-HTML-1.70.0
		>=dev-perl/Template-Toolkit-2.0.0
		dev-perl/Test-Differences
		dev-perl/namespace-clean
		>=dev-perl/Perl-Tidy-20060719.0.0
	)
"
DEPEND="
	virtual/perl-ExtUtils-MakeMaker
	test? (
		virtual/perl-Test-Simple
	)
"
