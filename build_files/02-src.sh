#!/usr/bin/env bash
set -euxo pipefail

## Get source code in this file...

os=Linux
ver=$(<"/ctx/build/winbox.version")

mkdir -p /src
curl -fSsL "https://download.mikrotik.com/routeros/winbox/${ver}/WinBox_${os}.zip" -o /src/WinBox_${os}.zip
cp /ctx/build/winbox.desktop /src/