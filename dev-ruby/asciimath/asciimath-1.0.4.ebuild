# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.adoc README.adoc"

inherit ruby-fakegem

DESCRIPTION="A pure Ruby AsciiMath parsing and conversion library"
HOMEPAGE="https://github.com/pepijnve/asciimath"

LICENSE="MIT"
SLOT="1"
KEYWORDS="~amd64 ~arm ~ppc"
IUSE=""

RUBY_PATCHES=( ${P}-backslashes.patch )
