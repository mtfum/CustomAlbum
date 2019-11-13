Pod::Spec.new do |spec|
  spec.name         = "CustomAlbum"
  spec.version      = "0.1.0"
  spec.summary      = "CustomAlbum automatically saves Image or Movie to app-specific album in Photos."
  spec.homepage     = "https://github.com/mtfum/CustomAlbum"
  spec.license      = { :type => "MIT", :file => 'LICENSE' }
  spec.author    = "mtfum"
  spec.social_media_url   = "https://twitter.com/mtfum"
  spec.platform     = :ios
	spec.swift_versions = ['5.1']
  spec.source       = { :git => "https://github.com/mtfum/CustomAlbum.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/**/*.swift"
	spec.ios.deployment_target = '10.0'
	spec.ios.frameworks = 'UIKit'
end
