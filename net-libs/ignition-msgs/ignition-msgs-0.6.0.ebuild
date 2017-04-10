# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit cmake-utils

DESCRIPTION="Protobuf messages and functions for robot applications"
HOMEPAGE="http://ignitionrobotics.org/libraries/messages https://bitbucket.org/ignitionrobotics/ign-msgs"
SRC_URI="https://osrf-distributions.s3.amazonaws.com/ign-msgs/releases/${P}.tar.bz2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/protobuf:=
	sci-libs/ignition-math:2="
RDEPEND="${DEPEND}"
CMAKE_BUILD_TYPE=RelWithDebInfo

src_configure() {
	# upstream appends this conditionally...
	append-flags "-fPIC"
	echo "set (CMAKE_C_FLAGS_ALL \"${CXXFLAGS} \${CMAKE_C_FLAGS_ALL}\")" > "${S}/cmake/HostCFlags.cmake"
	sed -i -e "s/LINK_FLAGS_RELWITHDEBINFO \" \"/LINK_FLAGS_RELWITHDEBINFO \" ${LDFLAGS} \"/" cmake/DefaultCFlags.cmake || die
	cmake-utils_src_configure
}
