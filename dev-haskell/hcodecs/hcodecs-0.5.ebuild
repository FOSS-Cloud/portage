# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

# ebuild generated by hackport 0.4.2.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

MY_PN="HCodecs"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A library to read, write and manipulate MIDI, WAVE, and SoundFont2 files"
HOMEPAGE="http://www-db.informatik.uni-tuebingen.de/team/giorgidze"
SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT=test # hung?

RDEPEND=">=dev-haskell/quickcheck-2.0:2=[profile?]
	dev-haskell/random:=[profile?]
	>=dev-lang/ghc-7.4.1:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.8
"

S="${WORKDIR}/${MY_P}"
