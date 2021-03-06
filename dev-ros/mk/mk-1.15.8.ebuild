# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ROS_REPO_URI="https://github.com/ros/ros"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=core/${PN}

inherit ros-catkin

DESCRIPTION="A collection of .mk include files for building ROS architectural elements"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
RDEPEND="${DEPEND}
	dev-ros/rospack
	dev-ros/rosbuild"
