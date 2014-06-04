# Copyright 2014 Virgil Dupras
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_3 )

inherit eutils python-r1

DESCRIPTION="Find duplicate files on your system"
HOMEPAGE="http://hardcoded.net/dupeguru"
MY_P="${PN}-src-${PV}"

# There are package conflicts in the Gentoo system when it comes to sip and PyQt4/PyQt5
# We avert the problem by installing everything locally.
# Yes, *very* inneficient, but for now, I can't think of a better solution
SRC_URI="http://download.hardcoded.net/${MY_P}.tar.gz
	http://sourceforge.net/projects/pyqt/files/sip/sip-4.16/sip-4.16.tar.gz
	http://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.3/PyQt-gpl-5.3.tar.gz"
S=${WORKDIR}

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	>=dev-qt/qtwidgets-5.3
	>=dev-qt/liguist-tools-5.3
	"
DEPEND="${RDEPEND}
	>=dev-python/sphinx-1.1.3"

src_configure() {
	pyvenv-3.3 env
	cd sip-4.16
	../env/bin/python configure.py -e ../env/include/python3.3
	emake install
	cd ../PyQt-gpl-5.3
	../env/bin/python configure.py --confirm-license --qmake=/usr/lib64/qt5/bin/qmake --sip=../env/bin/sip --sip-incdir=../env/include/python3.3
	emake install
	cd ..
	./env/bin/python get-pip.py
	./env/bin/pip install -r requirements.txt
	./env/bin/python configure.py
}

src_compile() {
	./env/bin/python build.py
	./env/bin/python -c "import package; package.package_arch('se')"
	./env/bin/python -c "from hscommon import build; build.copy_packages(['sip', 'PyQt5'], '${S}/build/dupeguru-se-arch')"
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

