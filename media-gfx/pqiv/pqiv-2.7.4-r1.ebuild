# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit linux-info flag-o-matic toolchain-funcs fdo-mime

DESCRIPTION="powerful GTK 3 based command-line image viewer with a minimal UI"
HOMEPAGE="https://github.com/phillipberndt/pqiv http://www.pberndt.com/Programme/Linux/pqiv/"
SRC_URI="https://github.com/phillipberndt/pqiv/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="archive ffmpeg imagemagick kernel_linux libav pdf postscript"

RDEPEND="
	>=dev-libs/glib-2.8:2
	>=x11-libs/cairo-1.6
	x11-libs/gtk+:3
	archive? ( app-arch/libarchive:0= )
	ffmpeg? (
		!libav? ( media-video/ffmpeg:0= )
		libav? ( media-video/libav:0= )
	)
	imagemagick? ( media-gfx/imagemagick:0= )
	pdf? ( app-text/poppler:0= )
	postscript? ( app-text/libspectre:0= )
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	if use kernel_linux; then
		CONFIG_CHECK="~INOTIFY_USER"
		linux-info_pkg_setup
	fi
}

src_prepare() {
	default
	sed -i \
		-e "s:/lib/:/$(get_libdir)/:g" \
		GNUmakefile || die

	# bug #603506
	append-ldflags -Wl,--disable-new-dtags
}

src_configure() {
	local backends="gdkpixbuf"
	use archive && backends="${backends},archive,archive_cbx"
	use ffmpeg || use libav && backends="${backends},libav"
	use imagemagick && backends="${backends},wand"
	use pdf && backends="${backends},poppler"
	use postscript && backends="${backends},spectre"

	./configure \
		--backends-build=shared \
		--backends=${backends} \
		--prefix="${EPREFIX}/usr" \
		--destdir="${ED}" \
		|| die
}

src_compile() {
	tc-export CC
	emake VERBOSE=1 CFLAGS="${CFLAGS}"
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
