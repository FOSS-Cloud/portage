# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EBO_DESCRIPTION="Protein domain analysis add-on package"

EBO_EAUTORECONF=1

inherit emboss-r2

KEYWORDS="~amd64 ~x86 ~x86-linux"

S="${WORKDIR}/DOMAINATRIX-0.1.650"
PATCHES=( "${FILESDIR}"/${PN}-0.1.650_fix-build-system.patch )
