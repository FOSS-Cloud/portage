# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# Tries to connect to local postgres server and other shenanigans
RESTRICT="test"

inherit cmake-utils

DESCRIPTION="Converts OSM data to SQL and insert into PostgreSQL db"
HOMEPAGE="http://wiki.openstreetmap.org/wiki/Osm2pgsql"
SRC_URI="https://github.com/openstreetmap/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+lua +pbf"

DEPEND="
	app-arch/bzip2
	dev-db/postgresql:=
	dev-libs/libxml2:2
	dev-libs/boost
	<sci-libs/geos-3.6.0
	sci-libs/proj
	sys-libs/zlib
	lua? ( dev-lang/lua:= )
	pbf? ( dev-libs/protobuf-c )
"
RDEPEND="${DEPEND}"
