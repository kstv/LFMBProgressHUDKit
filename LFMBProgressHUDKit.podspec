#
#  Be sure to run `pod spec lint LFMBProgressHUDKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name     = 'LFMBProgressHUDKit'
    s.version  = '1.0.3'
    s.license  = 'MIT'
    s.summary  = 'iOS HUD'
    s.homepage = 'https://github.com/LaiFengiOS/LFMBProgressHUDKit'
    s.authors  = { 'wangxiaoxiang' => 'wangxiaoxiang@youku.com' }
    s.source   = { :git => 'https://github.com/LaiFengiOS/LFMBProgressHUDKit.git', :tag => s.version, :submodules => true }
    s.requires_arc = true
    s.ios.deployment_target = '7.0'

    s.preserve_paths = 'releases/iOS/LFMBProgressHUDKit.framework'
    s.vendored_frameworks = 'releases/iOS/LFMBProgressHUDKit.framework'
    s.framework = "CoreGraphics"
    s.libraries = "z"
end
