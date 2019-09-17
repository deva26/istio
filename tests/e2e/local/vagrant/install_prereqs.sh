#!/bin/bash

# Copyright Istio Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

case "${OSTYPE}" in
  darwin*) ./install_prereqs_macos.sh;;
  linux*)
    DISTRO="$(lsb_release -i -s)"
    # If lsb_release is not installed on CentOS, DISTRO will be empty.
    if [[ -z "$DISTRO" && -f /etc/centos-release ]]; then
      DISTRO="CentOS"
    fi
    case "${DISTRO}" in
      Debian|Ubuntu)
        ./install_prereqs_debian.sh;;
      CentOS)
        ./install_prereqs_centos.sh;;
      *) echo "unsupported distro: ${DISTRO}" ;;
    esac;;
  *) echo "unsupported: ${OSTYPE}" ;;
esac
