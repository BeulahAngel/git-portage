# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-frameworks/kio/kio-5.5.0.ebuild,v 1.1 2014/12/17 21:24:20 mrueg Exp $

EAPI=5

VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="Framework providing transparent file and data management"
LICENSE="LGPL-2+"
KEYWORDS=" ~amd64"
IUSE="acl kerberos X"

RDEPEND="
	$(add_frameworks_dep karchive)
	$(add_frameworks_dep kbookmarks)
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kjobwidgets)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_frameworks_dep solid)
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtscript:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	dev-libs/libxml2
	dev-libs/libxslt
	acl? (
		sys-apps/attr
		virtual/acl
	)
	kerberos? ( virtual/krb5 )
	!<kde-base/kio-extras-5.0.95-r1:5
"
DEPEND="${RDEPEND}
	$(add_frameworks_dep kdoctools)
	dev-qt/qtconcurrent:5
	test? ( sys-libs/zlib )
	X? (
		x11-libs/libX11
		x11-libs/libXrender
		x11-proto/xproto
	)
"
PDEPEND="
	$(add_frameworks_dep kded)
"

# tests hang
RESTRICT="test"

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package acl)
		$(cmake-utils_use_find_package kerberos GSSAPI)
		$(cmake-utils_use_find_package X X11)
	)

	kde5_src_configure
}
