# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-haskell/terminfo/terminfo-0.3.2.5.ebuild,v 1.2 2013/02/13 21:26:15 slyfox Exp $

EAPI=5

# ebuild generated by hackport 0.3.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit autotools eutils haskell-cabal

DESCRIPTION="Haskell bindings to the terminfo library."
HOMEPAGE="http://code.haskell.org/terminfo"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~alpha ~amd64 ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-fbsd ~ppc-macos ~x86-macos"
IUSE=""

RDEPEND=">=dev-lang/ghc-6.10.4:=
		sys-libs/ncurses"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.4"

src_prepare() {
	epatch "${FILESDIR}"/${P}-tinfo.patch

	eautoreconf
}