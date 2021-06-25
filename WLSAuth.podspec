#
#  Be sure to run `pod spec lint WLSAuth.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "WLSAuth"
  spec.version      = "0.0.1"
  spec.summary      = "Authorization with social media"
  spec.description  = "Simple implementation of social media login, with native button each social media"
  spec.homepage     = "https://github.com/willsas/WLSAuth"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Willa Saskara" => "willasaskara@gmail.com" }
  spec.social_media_url   = "https://twitter.com/Willa Saskara"

 
  spec.platform     = :ios
  spec.platform     = :ios, "13.0"
  spec.source       = { :git => "https://github.com/willsas/WLSAuth.git", :tag => "#{spec.version}" }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"

  spec.requires_arc = true
  spec.swift_version= '5.0'
  spec.xcconfig     = { 'SWIFT_VERSION' => '5.0' }
  # spec.dependency "JSONKit", "~> 1.4"
  
  
end
