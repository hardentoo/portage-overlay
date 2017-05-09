# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit toolchain-funcs eutils

DESCRIPTION="a fast, lightweight, vim-like browser based on webkit"
HOMEPAGE="http://fanglingsu.github.io/vimb/"
MYPV="dcc2c39757b707dbf9978f13a0b17dcb32be4ce9"
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

src_compile() {
	emake PREFIX=/usr
}

src_install() {
	emake PREFIX=/usr DESTDIR="${D}" install
}
