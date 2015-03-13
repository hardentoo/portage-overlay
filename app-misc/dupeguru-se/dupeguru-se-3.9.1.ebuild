# Copyright 2015 Virgil Dupras
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_4 )

inherit eutils python-single-r1

DESCRIPTION="Find duplicate files on your system"
HOMEPAGE="http://hardcoded.net/dupeguru"
MY_P="${PN}-src-${PV}"

# There are package conflicts in the Gentoo system when it comes to sip and PyQt4/PyQt5
# We avert the problem by installing everything locally.
# Yes, *very* inneficient, but for now, I can't think of a better solution
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
"
DEPEND="
	${RDEPEND}
	>=dev-python/sphinx-1.1.3[${PYTHON_USEDEP}]
	>=dev-python/polib-1.0.4[${PYTHON_USEDEP}]
"

src_configure() {
	# For pip to be installed, we need to create the env without system-site-packages
	${EPYTHON} -m venv ${WORKDIR}/env
	${WORKDIR}/env/bin/pip install send2trash
	# This line below is because portage stable *still* hasn't updated to Python 3.4.2
	rm ${WORKDIR}/env/lib64
	# And now, we upgrade the env with system-site-packages
	${EPYTHON} -m venv --system-site-packages ${WORKDIR}/env
	${WORKDIR}/env/bin/python configure.py
}

src_compile() {
	./env/bin/python build.py
	python_fix_shebang run.py
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

