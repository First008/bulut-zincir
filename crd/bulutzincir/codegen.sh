#!/bin/bash -e

# Copyright 2016 The Rook Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

scriptdir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

${scriptdir}/../vendor/k8s.io/code-generator/generate-groups.sh \
  all \
  bulutzincir/bulutzincir/pkg/client \
  bulutzincir/bulutzincir/pkg/apis/bulutzincir \
  "ethereum:v1alpha1" \
  --output-base "$(dirname "${scriptdir}")" \
  --go-header-file "${scriptdir}"/boilerplate.go.txt \


cp -r bulutzincir/* ../bulutzincir
rm -rf bulutzincir

# set -o errexit
# set -o nounset
# set -o pipefail

# SCRIPT_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# CODEGEN_PKG=${CODEGEN_PKG:-$(cd "${SCRIPT_ROOT}"; ls -d -1 ../vendor/k8s.io/code-generator 2>/dev/null || echo ../code-generator)}

# # generate the code with:
# # --output-base    because this script should also be able to run inside the vendor dir of
# #                  k8s.io/kubernetes. The output-base is needed for the generators to output into the vendor dir
# #                  instead of the $GOPATH directly. For normal projects this can be dropped.
# bash "${CODEGEN_PKG}"/generate-groups.sh all \
#   bulutzincir/pkg/client \
#   bulutzincir/pkg/apis \
#   bulutzincir:v1alpha1 \
#   --output-base "$(dirname "${BASH_SOURCE[0]}")"/.. \
#   --go-header-file "${SCRIPT_ROOT}"/boilerplate.go.txt
