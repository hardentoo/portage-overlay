# Copyright 2014 Virgil Dupras
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_3 )

inherit eutils python-r1

DESCRIPTION="Find duplicate files on your system"
HOMEPAGE="http://hardcoded.net/dupeguru"
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
	./env/bin/pip install -r requirements.txt
	./env/bin/python configure.py
}

src_compile() {
	./env/bin/python build.py
	./env/bin/python -c "import package; package.package_arch('se')"
}

src_install() {
	RS=${S}/build/dupeguru-se-arch
	doicon ${WORKDIR}/images/dgse_logo_128.png
	domenu ${RS}/dupeguru-se.desktop
	insinto /usr/share/dupeguru-se
	doins -r ${RS}/*
	fperms a+x /usr/share/dupeguru-se/run.py
	dosym /usr/share/dupeguru-se/run.py /usr/bin/dupeguru-se
}

