# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{4,5} )
inherit distutils-r1

DESCRIPTION="Python library for MurmurHash3, fast and robust hash functions."
HOMEPAGE="https://pypi.python.org/pypi/mmh3"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
