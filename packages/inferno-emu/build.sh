TERMUX_PKG_HOMEPAGE=https://github.com/caerwynj/inferno64
TERMUX_PKG_DESCRIPTION="Inferno programming environment"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.0
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/caerwynj/inferno64/archive/71e8c7fdb3fc6eeda30c72d256f9990d613a51bd.tar.gz
TERMUX_PKG_SHA256=5bfa0fb587f4180bf42946fdc76c51126a6849668079f4878c15f6fc9f8be4a1
TERMUX_PKG_DEPENDS="libx11, xorg-proto, plan9port"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	9 mk mkdirs
	9 mk install
}

termux_step_make_install() {
	local dir=${TERMUX_PREFIX}/lib/inferno
	cp -r . ${dir}
	rm -f ${TERMUX_PREFIX}/bin/emu
	case "$HOSTTYPE" in
	aarch64)
		ln -s ../lib/inferno/Linux/arm64/bin/emu ${TERMUX_PREFIX}/bin/emu
		;;
	arm)
		ln -s ../lib/inferno/Linux/arm/bin/emu ${TERMUX_PREFIX}/bin/emu

		;;
	i686)
		ln -s ../lib/inferno/Linux/386/bin/emu ${TERMUX_PREFIX}/bin/emu

		;;
	x86_64)
		ln -s ../lib/inferno/Linux/amd64/bin/emu ${TERMUX_PREFIX}/bin/emu

		;;
	esac
}
