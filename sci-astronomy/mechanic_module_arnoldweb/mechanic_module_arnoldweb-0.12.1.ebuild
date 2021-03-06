# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

DESCRIPTION="The Arnoldweb module for Mechanic"
HOMEPAGE="http://git.astri.umk.pl/projects/mechanic"
SRC_URI="http://github.com/downloads/mslonina/MechanicModules/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="config"

DEPEND="sci-misc/mechanic
	virtual/mpi
	config? ( dev-libs/libreadconfig )"
RDEPEND="${DEPEND}"

pkg_setup() {
	export CC=mpicc
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use config LRC)
	)
	cmake-utils_src_configure
}
