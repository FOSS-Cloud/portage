# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/genindent/genindent-1.1.ebuild,v 1.10 2012/12/07 18:34:18 ulm Exp $

inherit vim-plugin

DESCRIPTION="vim plugin: library for simplifying indent files"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=678"
LICENSE="vim.org"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 sparc x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~x86-macos"
IUSE=""

VIM_PLUGIN_HELPTEXT=\
"This plugin provides library functions and is not intended to be used
directly by the user."