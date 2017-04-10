# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DIST_AUTHOR=PALIK
DIST_VERSION=2.002.004
inherit perl-module

DESCRIPTION="Gearman distributed job system, client and worker libraries"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	virtual/perl-Carp
	virtual/perl-IO
	virtual/perl-IO-Socket-IP
	dev-perl/IO-Socket-SSL
	dev-perl/List-MoreUtils
	>=dev-perl/Ref-Util-0.20.0
	virtual/perl-Scalar-List-Utils
	virtual/perl-Socket
	>=virtual/perl-Storable-1
	dev-perl/String-CRC32
	virtual/perl-Time-HiRes
	virtual/perl-version
"
DEPEND="${RDEPEND}
	virtual/perl-ExtUtils-MakeMaker
	test? (
		dev-perl/File-Which
		virtual/perl-Perl-OSType
		>=dev-perl/Proc-Guard-0.70.0
		dev-perl/Test-Differences
		dev-perl/Test-Exception
		virtual/perl-Test-Simple
		>=dev-perl/Test-TCP-2.170.0
		dev-perl/Test-Timer
	)
"

mydoc="CHANGES HACKING TODO"
