# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ROS_REPO_URI="https://github.com/ros/ros"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=ros

inherit ros-catkin

DESCRIPTION="ROS packaging system"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/rosbash
	dev-ros/rosboost_cfg
	dev-ros/rosclean
	dev-ros/roscreate
	dev-ros/rosmake
	dev-ros/rosunit

	dev-ros/mk
	dev-ros/rosbuild
	dev-ros/roslang
	dev-ros/roslib
"
DEPEND="${RDEPEND}"
