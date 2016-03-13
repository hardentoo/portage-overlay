# Copyright 2016 Virgil Dupras
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_4 )

inherit eutils python-single-r1

DESCRIPTION="Future-aware personal finances management"
HOMEPAGE="https://hardcoded.net/moneyguru"
MY_P="${PN}-src-${PV}"
SRC_URI="https://download.hardcoded.net/${MY_P}.tar.gz"
S=${WORKDIR}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/PyQt5[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/polib[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]"

src_compile() {
    # We have all our dependencies covered by the system. No need for a venv!
	${EPYTHON} build.py
	${EPYTHON} package.py --arch-pkg
}

src_install() {
	RS=${S}/build/moneyguru-arch
	into /
	doicon ${WORKDIR}/images/logo_big.png
	domenu ${WORKDIR}/debian/moneyguru.desktop
	insinto /usr/share/moneyguru
	doins -r ${RS}/*
	fperms a+x /usr/share/moneyguru/run.py
	dosym /usr/share/moneyguru/run.py /usr/bin/moneyguru
}

