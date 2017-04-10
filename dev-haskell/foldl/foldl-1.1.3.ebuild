# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Composable, streaming, and efficient left folds"
HOMEPAGE="http://hackage.haskell.org/package/foldl"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-haskell/comonad-4:=[profile?] <dev-haskell/comonad-5:=[profile?]
	>=dev-haskell/mwc-random-0.13.1.0:=[profile?] <dev-haskell/mwc-random-0.14:=[profile?]
	<dev-haskell/primitive-0.7:=[profile?]
	<dev-haskell/profunctors-5.3:=[profile?]
	>=dev-haskell/text-0.11.2.0:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/transformers-0.2.0.0:=[profile?] <dev-haskell/transformers-0.5:=[profile?]
	>=dev-haskell/vector-0.7:=[profile?] <dev-haskell/vector-0.12:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8.0.2
"
