# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

TEXLIVE_MODULE_CONTENTS="auto-pst-pdf bclogo dsptricks makeplot pdftricks pdftricks2 pedigree-perl psbao pst-2dplot pst-3d pst-3dplot pst-abspos pst-am pst-asr pst-bar pst-barcode pst-bezier pst-blur pst-bspline pst-calendar pst-circ pst-coil pst-cox pst-dbicons pst-diffraction pst-electricfield pst-eps pst-eucl pst-exa pst-fill pst-fit pst-fr3d pst-fractal pst-fun pst-func pst-gantt pst-geo pst-ghsb pst-gr3d pst-grad pst-graphicx pst-infixplot pst-intersect pst-jtree pst-knot pst-labo pst-layout pst-lens pst-light3d pst-magneticfield pst-math pst-mirror pst-node pst-ob3d pst-ode pst-optexp pst-optic pst-osci pst-ovl pst-pad pst-pdgr pst-perspective pst-platon pst-plot pst-poly pst-pulley pst-qtree pst-rubans pst-sigsys pst-slpe pst-solarsystem pst-solides3d pst-soroban pst-spectra pst-spirograph pst-stru pst-support pst-text pst-thick pst-tools pst-tree pst-tvz pst-uml pst-vectorian pst-vowel pst-vue3d pst2pdf pstricks pstricks-add pstricks_calcnotes uml vaucanson-g vocaltract collection-pstricks
"
TEXLIVE_MODULE_DOC_CONTENTS="auto-pst-pdf.doc bclogo.doc dsptricks.doc makeplot.doc pdftricks.doc pdftricks2.doc pedigree-perl.doc psbao.doc pst-2dplot.doc pst-3d.doc pst-3dplot.doc pst-abspos.doc pst-am.doc pst-asr.doc pst-bar.doc pst-barcode.doc pst-bezier.doc pst-blur.doc pst-bspline.doc pst-calendar.doc pst-circ.doc pst-coil.doc pst-cox.doc pst-dbicons.doc pst-diffraction.doc pst-electricfield.doc pst-eps.doc pst-eucl.doc pst-exa.doc pst-fill.doc pst-fit.doc pst-fr3d.doc pst-fractal.doc pst-fun.doc pst-func.doc pst-gantt.doc pst-geo.doc pst-ghsb.doc pst-gr3d.doc pst-grad.doc pst-graphicx.doc pst-infixplot.doc pst-intersect.doc pst-jtree.doc pst-knot.doc pst-labo.doc pst-layout.doc pst-lens.doc pst-light3d.doc pst-magneticfield.doc pst-math.doc pst-mirror.doc pst-node.doc pst-ob3d.doc pst-ode.doc pst-optexp.doc pst-optic.doc pst-osci.doc pst-ovl.doc pst-pad.doc pst-pdgr.doc pst-perspective.doc pst-platon.doc pst-plot.doc pst-poly.doc pst-pulley.doc pst-qtree.doc pst-rubans.doc pst-sigsys.doc pst-slpe.doc pst-solarsystem.doc pst-solides3d.doc pst-soroban.doc pst-spectra.doc pst-spirograph.doc pst-stru.doc pst-support.doc pst-text.doc pst-thick.doc pst-tools.doc pst-tree.doc pst-tvz.doc pst-uml.doc pst-vectorian.doc pst-vowel.doc pst-vue3d.doc pst2pdf.doc pstricks.doc pstricks-add.doc pstricks_calcnotes.doc uml.doc vaucanson-g.doc vocaltract.doc "
TEXLIVE_MODULE_SRC_CONTENTS="auto-pst-pdf.source makeplot.source pst-3d.source pst-abspos.source pst-am.source pst-bar.source pst-bezier.source pst-blur.source pst-dbicons.source pst-diffraction.source pst-electricfield.source pst-eps.source pst-fill.source pst-fit.source pst-fr3d.source pst-fun.source pst-gr3d.source pst-intersect.source pst-lens.source pst-light3d.source pst-magneticfield.source pst-ob3d.source pst-optexp.source pst-optic.source pst-pad.source pst-pdgr.source pst-platon.source pst-pulley.source pst-rubans.source pst-slpe.source pst-solarsystem.source pst-soroban.source pst-text.source pst-thick.source pst-tree.source pst-tvz.source pst-uml.source pst-vue3d.source uml.source "
inherit  texlive-module
DESCRIPTION="TeXLive PSTricks"

LICENSE=" GPL-1 GPL-2 LGPL-2 LPPL-1.3 public-domain "
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ~mips ppc ppc64 ~s390 ~sh x86 ~amd64-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x64-solaris ~x86-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-basic-2015
>=dev-texlive/texlive-genericrecommended-2015
"
RDEPEND="${DEPEND} dev-texlive/texlive-genericrecommended
dev-tex/pgf
"
TEXLIVE_MODULE_BINSCRIPTS="
	texmf-dist/scripts/pst2pdf/pst2pdf.pl
	texmf-dist/scripts/pedigree-perl/pedigree.pl
"
PATCHES=( "${FILESDIR}/pedigreeloc.patch" )
