# Copyright 2019 Viacom, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.#
# Be sure to run `pod lib lint KDTree.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ViaSwiftUtils"
  s.version          = "2.1.0"
  s.summary          = "Swift Utilities written with and for Viacom Inc."
  s.swift_versions   = ['4.0', '4.2', '5.0']

# This description is used to generate tags and improve search results.
  s.description      = "Goodie box of small helper functions/extensions used in many Swift Apps at Viacom"

  s.homepage         = "https://github.com/ViacomInc/ViaSwiftUtils"
  s.license          = { :type => 'Apache License, Version 2.0' }
  s.author           = { "Konrad Feiler" => "konrad.feiler@vimn.com" }
  s.source           = { :git => "https://github.com/ViacomInc/ViaSwiftUtils.git", :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.ios.source_files = 'Sources/ViaSwiftUtils/**/*'
  s.osx.source_files = 'Sources/ViaSwiftUtils/Foundation/*'
  s.watchos.source_files = 'Sources/ViaSwiftUtils/Foundation/*'
  s.tvos.source_files = 'Sources/ViaSwiftUtils/Foundation/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
