# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

XORG_DOC="doc"
XORG_MULTILIB=yes
inherit xorg-2

DESCRIPTION="X.Org Xlib-based client API for the XTEST & RECORD extensions library"

KEYWORDS="alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~arm-linux ~x86-linux ~ppc-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris ~x86-winnt"
IUSE=""

RDEPEND=">=x11-libs/libX11-1.6.2[${MULTILIB_USEDEP}]
	>=x11-libs/libXext-1.3.2[${MULTILIB_USEDEP}]
	>=x11-libs/libXi-1.7.2[${MULTILIB_USEDEP}]
	>=x11-proto/recordproto-1.14.2-r1[${MULTILIB_USEDEP}]
	>=x11-proto/xextproto-7.2.1-r1[${MULTILIB_USEDEP}]
	>=x11-proto/inputproto-2.3[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
