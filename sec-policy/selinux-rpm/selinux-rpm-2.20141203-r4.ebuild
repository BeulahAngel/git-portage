# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-rpm/selinux-rpm-2.20141203-r4.ebuild,v 1.2 2015/04/15 15:55:30 perfinion Exp $
EAPI="5"

IUSE=""
MODS="rpm"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for rpm"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi
