#!/usr/bin/env bash

pkgs=(
	@c-development
	clang
	cmake
	fontconfig-devel
	git
	libcxx-devel
	libX11-devel
	libXcursor-devel
	libXi-devel
	libXrandr-devel
	mesa-libGL-devel
	meson
	ninja
	ninja-build
	yaml-cpp
	yaml-cpp-devel
)

set -euxo pipefail
dnf5 install -y "${pkgs[@]}"
