Pod::Spec.new do |s|
  s.name                  = 'MiCallSDK'
  s.version               = '1.0.0'
  s.homepage           = "https://github.com/ldev1211/micall-sdk-ios"
  s.summary            = "MiCallSDK Framework"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LDev' => 'luongdien1211@gmail.com' }

  s.description        = "MiCallSDK easy to make call/video call app2app, app2phone "
  s.homepage           = "https://github.com/ldev1211/micall-sdk-ios"
  s.swift_version = '5.0'
  s.ios.deployment_target = '12.0'
  s.source           = { :git => 'https://github.com/ldev1211/micall-sdk-ios.git', :tag => s.version.to_s }

  s.source_files = 'MiCallSDK/MiCallSDK/**/**'
  #s.public_header_files =  'MiCallSDK/MiCallSDK/**/**'
  s.libraries = 'stdc++'
  s.pod_target_xcconfig = {'OTHER_LDFLAGS' => '-ObjC'}
  #s.vendored_frameworks = "MiCallSDK.xcframework"
  s.frameworks = 'CoreMedia', 'VideoToolbox', 'AudioToolbox', 'AVFoundation',  'CoreMedia'
  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

end