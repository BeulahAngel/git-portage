# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/activemodel/activemodel-4.1.12.ebuild,v 1.2 2015/07/08 07:17:28 graaff Exp $

EAPI=5

USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.rdoc"

RUBY_FAKEGEM_GEMSPEC="activemodel.gemspec"

inherit ruby-fakegem versionator

DESCRIPTION="A toolkit for building modeling frameworks like Active Record and Active Resource"
HOMEPAGE="https://github.com/rails/rails"
SRC_URI="https://github.com/rails/rails/archive/v${PV}.tar.gz -> rails-${PV}.tgz"

LICENSE="MIT"
SLOT="$(get_version_component_range 1-2)"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE=""

RUBY_S="rails-${PV}/${PN}"

ruby_add_rdepend "
	~dev-ruby/activesupport-${PV}
	>=dev-ruby/builder-3.1:* =dev-ruby/builder-3*:*
"

ruby_add_bdepend "
	test? (
		>=dev-ruby/railties-4.0.0
		dev-ruby/test-unit:2
		>=dev-ruby/mocha-0.14.0:0.14
		>=dev-ruby/bcrypt-ruby-3.1.7
	)"

all_ruby_prepare() {
	# Remove items from the common Gemfile that we don't need for this
	# test run. This also requires handling some gemspecs.
	sed -i -e "/\(system_timer\|sdoc\|w3c_validators\|pg\|jquery-rails\|'mysql'\|journey\|ruby-prof\|benchmark-ips\|kindlerb\|turbolinks\|coffee-rails\|debugger\|sprockets-rails\|redcarpet\|uglifier\|minitest\|sprockets\|stackprof\)/ s:^:#:" \
		-e '/group :doc/,/^end/ s:^:#:' ../Gemfile || die
	rm ../Gemfile.lock || die
}
