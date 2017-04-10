# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23"

RUBY_FAKEGEM_NAME="gsl"
inherit ruby-fakegem multilib

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="ChangeLog README.md"

DESCRIPTION="Ruby interface to GNU Scientific Library"
HOMEPAGE="https://github.com/SciRuby/rb-gsl"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc"

DEPEND+=" >=sci-libs/gsl-2.3[deprecated]"
RDEPEND+=" >=sci-libs/gsl-2.3[deprecated]"

RUBY_S="${PN}-${P}"

RUBY_PATCHES=( "${FILESDIR}"/${P}-narray-superclass.patch )

ruby_add_bdepend "dev-ruby/narray"
ruby_add_rdepend "dev-ruby/narray"

all_ruby_prepare() {
	sed -i -e '/LOCAL_LIBS/ s: -l: -L#{path.gsub("ext", "lib")} -l:' ext/gsl_native/extconf.rb || die
	# nmatrix only tests
	rm -r test/gsl/nmatrix_tests || die
}

each_ruby_configure() {
	NARRAY=1 ${RUBY} -Cext/gsl_native extconf.rb || die
}

each_ruby_compile() {
	NARRAY=1 emake -Cext/gsl_native V=1
	cp ext/gsl_native/*$(get_modname) lib/ || die
}

each_ruby_test() {
	NARRAY=1 ${RUBY} -Ilib:test:. -e 'Dir["test/**/*_test.rb"].each{|f| require f}' || die
}
