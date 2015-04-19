# Copyright 2015 Virgil Dupras
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{3_3,3_4} )
PYTHON_REQ_USE="sqlite"

inherit eutils python-single-r1

DESCRIPTION="Find duplicate pictures on your system"
HOMEPAGE="http://hardcoded.net/dupeguru_pe"
MY_P="${PN}-src-${PV}"

SRC_URI="http://download.hardcoded.net/${MY_P}.tar.gz"
S=${WORKDIR}

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

RDEPEND="
	${PYTHON_DEPS}
	>=dev-python/PyQt5-5.3[${PYTHON_USEDEP},widgets]
	>=dev-python/polib-1.0.4[${PYTHON_USEDEP}]
	>=dev-python/send2trash-1.3.0[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	>=dev-python/sphinx-1.1.3[${PYTHON_USEDEP}]
"

src_configure() {
	${EPYTHON} configure.py --edition=pe
}

src_compile() {
	${EPYTHON} build.py
	python_fix_shebang run.py
	${EPYTHON} -c "import package; package.package_arch('pe')"
}

src_install() {
	RS=${S}/build/dupeguru-pe-arch
	doicon ${WORKDIR}/images/dgpe_logo_128.png
	domenu ${RS}/dupeguru-pe.desktop
	insinto /usr/share/dupeguru-pe
	doins -r ${RS}/*
	fperms a+x /usr/share/dupeguru-pe/run.py
	dosym /usr/share/dupeguru-pe/run.py /usr/bin/dupeguru-pe
}

