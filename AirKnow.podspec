Pod::Spec.new do |s|
  s.name     = 'AirKnow'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'A air quality app.'
  s.homepage = 'https://github.com/cbangchen/AirKnow'
  s.social_media_url = 'https://github.com/cbangchen/AirKnow'
  s.authors  = { 'cbangchen' => 'https://github.com/cbangchen' }
  s.source   = { :git => '--', :tag => s.version, :submodules => true }
  s.requires_arc = true
  
  s.vendored_frameworks = "Carthage/Build/iOS/AFNetworking.framework", 
  "Carthage/Build/iOS/AwesomeCache.framework",
  "Carthage/Build/iOS/IGListKit.framework",
  "Carthage/Build/iOS/SnapKit.framework",
  "Carthage/Build/iOS/ScrollableGraphView.framework",
  "Carthage/Build/iOS/SwiftyJSON.framework",
  "Carthage/Build/iOS/SwifterSwift.framework",
  "Carthage/Build/iOS/CHIPageControl.framework",
  "Carthage/Build/iOS/SwiftTheme.framework"

  s.frameworks = 'Foundation, CoreGraphics, Security, MobileCoreServices, SystemConfiguration, UIKit'
end