# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ROS_REPO_URI="https://github.com/ros/ros"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=tools/${PN}

inherit ros-catkin

DESCRIPTION="Tool for determining cflags/lflags/etc. of boost on your system"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
