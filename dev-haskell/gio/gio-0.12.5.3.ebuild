# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.3.5.9999

#nocabaldep is for the fancy cabal-detection feature at build-time
CABAL_FEATURES="lib profile haddock hoogle hscolour nocabaldep"
inherit haskell-cabal

DESCRIPTION="Binding to the GIO"
HOMEPAGE="http://projects.haskell.org/gtk2hs/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0/${PV}"
KEYWORDS="~alpha amd64 ~ia64 ppc ppc64 sparc x86"
IUSE=""

RDEPEND=">=dev-haskell/glib-0.12.5.3:0=[profile?] <dev-haskell/glib-0.13:0=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-lang/ghc-6.10.4:=
	dev-libs/glib:2
"
DEPEND="${RDEPEND}
	>=dev-haskell/gtk2hs-buildtools-0.12.5.1-r1:0=
	virtual/pkgconfig
"
