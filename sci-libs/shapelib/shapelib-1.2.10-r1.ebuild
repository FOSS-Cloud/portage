# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sci-libs/shapelib/shapelib-1.2.10-r1.ebuild,v 1.8 2012/08/02 19:01:46 bicatali Exp $

EAPI=4
inherit eutils toolchain-funcs multilib

DESCRIPTION="Library for manipulating ESRI Shapefiles"
HOMEPAGE="http://shapelib.maptools.org/"
SRC_URI="http://dl.maptools.org/dl/shapelib//${P}.tar.gz"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86 ~amd64-linux ~x86-linux"
IUSE="static-libs"

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/makefile-fix.patch
	epatch "${FILESDIR}"/fix-shapelib-test.diff
	epatch "${FILESDIR}"/stdlib_include_fix.patch
	sed -i \
		-e "s:/usr/local/:\$(DESTDIR)/${EPREFIX}/usr/:g" \
		-e "s:/usr/lib:/usr/$(get_libdir):g" \
		-e "s:SHPLIB_VERSION=1.2.9:SHPLIB_VERSION=${PV}:g" \
		-e "s:-g:${CFLAGS}:" \
		-e "s:-g -O2:${CFLAGS}:g" \
		-e "s:link gcc :link $(tc-getCC) ${LDFLAGS}:" \
		Makefile || die "sed failed"
}

src_compile() {
	emake all
	emake lib
}

src_install() {
	dobin shp{create,dump,test,add} dbf{create,dump,add}
	emake DESTDIR="${D}" lib_install
	dodoc ChangeLog
	dohtml *.html
	use static-libs || rm -f "${ED}"/usr/$(get_libdir)/lib*.a
}
