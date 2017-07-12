# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{4,5,6} )

inherit distutils-r1

DESCRIPTION="Add .env support to your django/flask apps in development and deployments"
HOMEPAGE="http://github.com/theskumar/python-dotenv"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64"

DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/click-5.0[${PYTHON_USEDEP}]
"
