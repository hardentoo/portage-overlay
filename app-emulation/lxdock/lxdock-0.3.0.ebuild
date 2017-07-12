# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Build and orchestrate your development environments with LXD"
HOMEPAGE="https://github.com/lxdock/lxdock"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/colorlog-2.0[${PYTHON_USEDEP}]
	>=dev-python/pylxd-2.2.4[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.6[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.0[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.9[${PYTHON_USEDEP}]
	!>=dev-python/requests-2.16[${PYTHON_USEDEP}]
"

src_prepare() {
	default_src_prepare

	# Temporary workaround. setup.py is fixed in git master.
	rm -rf "${S}/tests" || die
}
