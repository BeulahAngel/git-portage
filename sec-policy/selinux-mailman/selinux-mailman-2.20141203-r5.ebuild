# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/sec-policy/selinux-mailman/selinux-mailman-2.20141203-r5.ebuild,v 1.2 2015/06/05 16:10:28 perfinion Exp $
EAPI="5"

IUSE=""
MODS="mailman"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for mailman"

if [[ $PV == 9999* ]] ; then
	KEYWORDS=""
else
	KEYWORDS="amd64 x86"
fi
