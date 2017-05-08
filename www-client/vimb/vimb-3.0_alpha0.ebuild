# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs eutils

DESCRIPTION="a fast, lightweight, vim-like browser based on webkit"
HOMEPAGE="http://fanglingsu.github.io/vimb/"
MYPV="904f8267fce2037a87025d0dd06007daf5b4c208"
SRC_URI="https://github.com/fanglingsu/${PN}/archive/${MYPV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=net-libs/libsoup-2.56:2.4
	>=net-libs/webkit-gtk-2.16:4
	x11-libs/gtk+:3
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_unpack() {
	unpack ${A}
	mv vimb-${MYPV} ${P}
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
}
