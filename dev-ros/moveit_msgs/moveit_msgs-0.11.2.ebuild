# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

ROS_REPO_URI="https://github.com/ros-planning/moveit_msgs"
CATKIN_HAS_MESSAGES=yes
KEYWORDS="~amd64 ~arm"
CATKIN_MESSAGES_TRANSITIVE_DEPS="
	dev-ros/actionlib_msgs
	dev-ros/sensor_msgs
	dev-ros/geometry_msgs
	dev-ros/trajectory_msgs
	dev-ros/shape_msgs
	dev-ros/std_msgs
	dev-ros/octomap_msgs
	dev-ros/object_recognition_msgs
"

inherit ros-catkin

DESCRIPTION="Messages, services and actions used by MoveIt"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
