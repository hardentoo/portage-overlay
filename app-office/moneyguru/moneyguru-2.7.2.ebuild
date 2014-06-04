# Copyright 2014 Virgil Dupras
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4} )

inherit eutils python-r1

DESCRIPTION="Future-aware personal finances management"
HOMEPAGE="http://hardcoded.net/moneyguru"
MY_P="${PN}-src-${PV}"
SRC_URI="http://download.hardcoded.net/${MY_P}.tar.gz"
S=${WORKDIR}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	dev-python/PyQt4[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/sphinx[${PYTHON_USEDEP}]
	dev-python/virtualenv[${PYTHON_USEDEP}]"

src_configure() {
	virtualenv -p python3 --system-site-packages env
	./env/bin/pip install sgmllib3k polib
	./env/bin/python configure.py
}

src_compile() {
	./env/bin/python build.py
	./env/bin/python -c "import package; package.package_arch()"
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

