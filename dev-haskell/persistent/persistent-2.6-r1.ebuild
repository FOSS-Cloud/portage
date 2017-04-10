# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.5.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Type-safe, multi-backend data serialization"
HOMEPAGE="http://www.yesodweb.com/book/persistent"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="nooverlap"

RDEPEND=">=dev-haskell/aeson-0.5:=[profile?]
	dev-haskell/attoparsec:=[profile?]
	dev-haskell/base64-bytestring:=[profile?]
	>=dev-haskell/blaze-html-0.5:=[profile?]
	>=dev-haskell/blaze-markup-0.5.1:=[profile?]
	>=dev-haskell/conduit-1.0:=[profile?]
	>=dev-haskell/exceptions-0.6:=[profile?]
	>=dev-haskell/fast-logger-2.1:=[profile?]
	>=dev-haskell/http-api-data-0.2:=[profile?]
	>=dev-haskell/lifted-base-0.1:=[profile?]
	>=dev-haskell/monad-control-0.3:=[profile?]
	>=dev-haskell/monad-logger-0.3:=[profile?]
	dev-haskell/mtl:=[profile?]
	dev-haskell/old-locale:=[profile?]
	>=dev-haskell/path-pieces-0.1:=[profile?]
	>=dev-haskell/resource-pool-0.2.2.0:=[profile?]
	>=dev-haskell/resourcet-1.1:=[profile?]
	dev-haskell/scientific:=[profile?]
	dev-haskell/silently:=[profile?]
	dev-haskell/tagged:=[profile?]
	>=dev-haskell/text-0.8:=[profile?]
	dev-haskell/transformers-base:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	dev-haskell/vector:=[profile?]
	>=dev-lang/ghc-7.8.2:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( >=dev-haskell/hspec-1.3
		>=dev-haskell/http-api-data-0.2 )
"

src_prepare() {
	default

	cabal_chdeps \
		'http-api-data            >= 0.2       && < 0.3' 'http-api-data            >= 0.2'
}

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag nooverlap nooverlap)
}
