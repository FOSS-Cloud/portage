# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="Features.txt History.txt README.md"

inherit ruby-fakegem

DESCRIPTION="A module that adds logging/trace functionality"
HOMEPAGE="https://github.com/jpace/logue"

SRC_URI="https://github.com/jpace/logue/archive/v${PV}.tar.gz -> ${PN}-git-${PV}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~hppa ~ppc ~sparc x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rainbow-2.0.0"
