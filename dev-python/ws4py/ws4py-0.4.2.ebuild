# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6} )
PYTHON_REQ_USE="threads?"

inherit distutils-r1
if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/Lawouach/WebSocket-for-Python.git"
	inherit git-2
else
	SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64 ~arm ~x86"
fi

DESCRIPTION="WebSocket client and server library for Python 2 and 3 as well as PyPy"
HOMEPAGE="https://github.com/Lawouach/WebSocket-for-Python"

LICENSE="BSD"
SLOT="0"
IUSE="test +threads tornado cherrypy gevent"
# doc build requires sphinxcontrib ext packages absent from portage

RDEPEND="gevent? (
			>=dev-python/greenlet-0.4.1[${PYTHON_USEDEP}]
			dev-python/gevent[${PYTHON_USEDEP}]
		)
		tornado? ( >=www-servers/tornado-3.1[${PYTHON_USEDEP}] )
		cherrypy? ( >=dev-python/cherrypy-3.2.4[${PYTHON_USEDEP}] )"
DEPEND="test? (
		>=dev-python/cherrypy-3.2.4[${PYTHON_USEDEP}]
		dev-python/unittest2[${PYTHON_USEDEP}]
		>=dev-python/mock-1.0.1[${PYTHON_USEDEP}]
	)"

python_test() {
	# testsuite displays an issue with mock under py3 but is non fatal
	"${PYTHON}" -m unittest discover || die "Tests failed under ${EPYTHON}"
}
