# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/File-Map/File-Map-0.560.0.ebuild,v 1.8 2015/06/13 22:47:08 dilfridge Exp $

EAPI=5

MODULE_AUTHOR=LEONT
MODULE_VERSION=0.56
inherit perl-module

DESCRIPTION="Memory mapping made simple and safe"

SLOT="0"
KEYWORDS="amd64 arm ppc x86 ~amd64-linux ~x86-linux"
IUSE="test"

RDEPEND="
	dev-perl/Const-Fast
	dev-perl/PerlIO-Layers
	>=dev-perl/Sub-Exporter-Progressive-0.1.5
"
DEPEND="${RDEPEND}
	dev-perl/Module-Build
	test? (
		dev-perl/Test-Exception
		dev-perl/Test-NoWarnings
		dev-perl/Test-Warn
	)
"
SRC_TEST=do
