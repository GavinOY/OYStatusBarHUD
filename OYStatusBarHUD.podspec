#
#  Be sure to run `pod spec lint OYStatusBarHUD.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "OYStatusBarHUD"
  s.version      = "0.0.1"
  s.summary      = "A  OYStatusBarHUD view used on iOS"

  s.homepage     = "https://github.com/GavinOY/OYStatusBarHUD"
  s.license      = "MIT"

  s.author             = { "gavin" => "zhx-oy@hotmail.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "https://github.com/GavinOY/OYStatusBarHUD.git", :tag => "0.0.1" }
  s.source_files  = "OYStatusBarHUD/*"
  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"
  s.requires_arc = true
end
