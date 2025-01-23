Pod::Spec.new do |s|
  s.name             = 'MiCallSDK'
  s.version          = '1.2.0'
  s.summary          = 'MiCallSDK Framework.'
  s.description      = "MiCallSDK easy to make call/video call app2app, app2phone"
  s.homepage         = 'https://github.com/ldev1710/micall-sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LDev' => 'luongdien1211@gmail.com' }
  s.source           = { :git => 'https://github.com/ldev1710/micall-sdk.git', :tag => s.version }
  s.platform         = :ios, "13.0"
  s.swift_version    = '5.0'
  s.source_files     = 'MiCallSDK/Classes/**/*'
  


  # Include static libraries (.a) and headers
  #s.ios.vendored_libraries = 'MiCallSDK/ThirdParty/PJSUA2/*.a'
  s.private_header_files = 'MiCallSDK/ThirdParty/PJSUA2/**/*.h'
  s.preserve_paths = 'MiCallSDK/ThirdParty/PJSUA2/**/*'

  # Frameworks and libraries required by PJSUA2
  s.frameworks = ['VideoToolbox', 'AudioToolbox', 'AVFoundation', 'CoreMedia','Foundation']
  s.libraries = ['c++', 'z', 'resolv'] # Các thư viện cần thiết khác
end
