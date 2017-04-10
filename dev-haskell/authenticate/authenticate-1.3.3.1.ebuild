# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

# ebuild generated by hackport 0.4.7.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Authentication methods for Haskell web applications"
HOMEPAGE="https://github.com/yesodweb/authenticate"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE="+network-uri"

RDEPEND=">=dev-haskell/aeson-0.5:=[profile?]
	dev-haskell/attoparsec:=[profile?]
	dev-haskell/blaze-builder:=[profile?]
	>=dev-haskell/case-insensitive-0.2:=[profile?]
	>=dev-haskell/conduit-0.5:=[profile?]
	>=dev-haskell/http-conduit-1.5:=[profile?]
	>=dev-haskell/http-types-0.6:=[profile?]
	dev-haskell/monad-control:=[profile?]
	dev-haskell/resourcet:=[profile?]
	>=dev-haskell/tagstream-conduit-0.5.5:=[profile?]
	dev-haskell/text:=[profile?]
	>=dev-haskell/transformers-0.1:=[profile?]
	dev-haskell/unordered-containers:=[profile?]
	>=dev-haskell/xml-conduit-1.0:=[profile?]
	>=dev-lang/ghc-7.4.1:=
	network-uri? ( >=dev-haskell/network-uri-2.6:=[profile?] )
	!network-uri? ( <dev-haskell/network-2.6:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag network-uri network-uri)
}
