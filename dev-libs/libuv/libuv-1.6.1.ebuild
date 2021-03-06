# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libuv/libuv-1.6.1.ebuild,v 1.1 2015/06/15 11:43:24 mgorny Exp $

EAPI=5

inherit autotools-utils eutils multilib multilib-minimal

DESCRIPTION="Cross-platform asychronous I/O"
HOMEPAGE="https://github.com/libuv/libuv"
SRC_URI="https://github.com/libuv/libuv/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD BSD-2 ISC MIT"
SLOT="0/1"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~sparc ~x86 ~amd64-linux ~x86-linux"
IUSE="static-libs"

DEPEND="sys-devel/libtool
	virtual/pkgconfig[${MULTILIB_USEDEP}]"

src_prepare() {
	echo "m4_define([UV_EXTRA_AUTOMAKE_FLAGS], [serial-tests])" \
		> m4/libuv-extra-automake-flags.m4 || die

	eautoreconf
}

multilib_src_configure() {
	local myeconfargs=(
		cc_cv_cflags__g=no
		$(use_enable static-libs static)
	)
	autotools-utils_src_configure
}

multilib_src_test() {
	mkdir test || die
	cp -pPR "${S}"/test/fixtures test/fixtures || die
	default
}

multilib_src_install_all() {
	einstalldocs
	prune_libtool_files
}
