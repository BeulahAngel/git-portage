# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sys-libs/fortify-headers/fortify-headers-0.5.ebuild,v 1.1 2015/07/03 13:23:08 blueness Exp $

EAPI=5

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://git.2f30.org/fortify-headers"
	inherit git-2
else
	SRC_URI="http://git.2f30.org/fortify-headers/snapshot/fortify-headers-${PV}.tar.gz"
	KEYWORDS="~amd64 ~arm ~mips ~ppc ~x86"
fi

DESCRIPTION="A standalone implementation of fortify source."
HOMEPAGE="http://git.2f30.org/fortify-headers/"

LICENSE="ISC"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i -e 's|^PREFIX = /usr/local|PREFIX = /usr|g' Makefile
	export DESTDIR="${D}"
}
