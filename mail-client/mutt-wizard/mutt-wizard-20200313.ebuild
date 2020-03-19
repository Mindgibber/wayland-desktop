# Copyright 2019-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A system for automatically configuring mutt and isync"
HOMEPAGE="https://github.com/LukeSmithxyz/mutt-wizard"

COMMIT=5ace69bdf56da3883b2666247aac462b0df5b020
SRC_URI="https://github.com/LukeSmithxyz/${PN}/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
IUSE="+notmuch links +w3m lynx +libnotify +abook +gpg +cron +imagemagick"

DEPEND="mail-client/neomutt:=[notmuch=]
	net-mail/isync
	mail-mta/msmtp
	app-admin/pass
"

RDEPEND="
	${DEPEND}
	cron? ( virtual/cron )
	imagemagick? ( media-gfx/imagemagick )
	lynx? ( www-client/lynx )
	links? ( www-client/links )
	w3m? ( www-client/w3m )
	libnotify? ( x11-libs/libnotify )
	abook? ( app-misc/abook )
	gpg? ( app-crypt/gnupg )
"

BDEPEND="net-mail/isync
	app-admin/pass
"

src_compile() {
	return 0;
}

src_install() {
	emake PREFIX="/usr" DESTDIR="${D}" install
	einstalldocs
}
