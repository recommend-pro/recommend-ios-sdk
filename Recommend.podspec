Pod::Spec.new do |spec|
  spec.name          = 'Recommend'
  spec.version       = '0.1.2'
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.homepage      = 'https://github.com/recommend-pro/recommend-ios-sdk'
  spec.authors       = "Recommend OÜ"
  spec.summary       = 'Personalisation and 360° Marketing Platform for eCommerce'
  spec.source        = { :git => 'https://github.com/recommend-pro/recommend-ios-sdk.git', :tag => 'v' + spec.version.to_s }
  spec.module_name   = 'Recommend'
  spec.swift_version = '5.3'

  spec.ios.deployment_target  = '11.0'

  spec.source_files   = 'Recommend/Sources/**/*'

  spec.ios.framework  = 'UIKit'
  spec.ios.framework  = 'UserNotifications'
end
