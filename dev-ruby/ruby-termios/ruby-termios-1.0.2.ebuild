# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="README.md termios.rd"

# There are no tests in the gem, and the upstream tests only work 
# with a normal TTY, bug 340575.
RUBY_FAKEGEM_RECIPE_TEST="none"

inherit multilib ruby-fakegem

DESCRIPTION="A Ruby interface to termios"
HOMEPAGE="http://arika.org/ruby/termios"
LICENSE="Ruby"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~mips ~ppc ~x86 ~x86-macos"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake -Cext V=1
	cp ext/termios$(get_modname) lib/ || die
}
