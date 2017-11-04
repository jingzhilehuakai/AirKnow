Pod::Spec.new do |s|
  s.name         = "SwiftTheme"
  s.version      = "0.3.3"
  s.summary      = "Powerful theme/skin manager for iOS 7+ 主题/换肤, 夜间模式"
  s.homepage     = "https://github.com/jiecao-fm/SwiftTheme"

  s.license      = 'MIT'
  s.author       = { "GeSen" => "i@gesen.me" }
  s.source       = { :git => "https://github.com/jiecao-fm/SwiftTheme.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Source'
end
