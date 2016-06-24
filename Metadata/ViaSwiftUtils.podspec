#
# Be sure to run `pod lib lint KDTree.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "ViaSwiftUtils"
  s.version          = "0.1.2"
  s.summary          = "Swift Utilities written with and for Viacom Inc."

# This description is used to generate tags and improve search results.
  s.description      = ""

#  s.homepage         = "https://github.com/Bersaelor/KDTree"
#  s.screenshots      = "https://raw.githubusercontent.com/Bersaelor/KDTree/master/Screenshots/kNearest.png", "https://raw.githubusercontent.com/Bersaelor/KDTree/master/Screenshots/tesselations.png"
#  s.license          = 'MIT'
  s.author           = { "Konrad Feiler" => "konrad.feiler@vimn.com" }
#  s.source           = { :git => "https://github.com/Bersaelor/KDTree.git", :tag => s.version.to_s }

  s.ios.deployment_target = '8.4'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
end
