Pod::Spec.new do |s|
  s.name             = 'Recommend'
  #s.version          = '1.0.0'
  s.summary          = ''
  s.description      = <<-DESC

                       DESC
  s.homepage         = 'https://github.com/recommend-pro/recommend-ios-sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.authors          = "Recommend OÜ"
  s.source           = {
    :git => 'https://github.com/recommend-pro/recommend-ios-sdk.git',
    :tag => 'v' + s.version.to_s
  }
  s.ios.deployment_target = "11.0"
  s.swift_version = "5.0"
  s.source_files  = [
    "Recommend/Sources/**/*",
  ]
  s.frameworks = [

  ]
end