# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_4 )
PYTHON_REQ_USE="sqlite"

inherit eutils python-single-r1

DESCRIPTION="Future-aware personal finances management"
HOMEPAGE="https://hardcoded.net/moneyguru"
MY_P="${PN}-src-${PV}"
SRC_URI="https://download.hardcoded.net/${MY_P}.tar.gz"
S=${WORKDIR}

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/PyQt5[${PYTHON_USEDEP},gui,widgets,printsupport]"
DEPEND="${RDEPEND}
	dev-python/polib[${PYTHON_USEDEP}]"

src_compile() {
	NO_VENV=1 emake
}
