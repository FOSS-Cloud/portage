# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
GST_ORG_MODULE=gst-plugins-ugly

inherit gstreamer

DESCRIPTION="DVD read plugin for GStreamer"
KEYWORDS="~alpha amd64 arm hppa ~ia64 ppc ppc64 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=">=media-libs/libdvdread-4.2.0-r1[${MULTILIB_USEDEP}]"
DEPEND="${RDEPEND}"
