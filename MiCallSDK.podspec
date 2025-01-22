Pod::Spec.new do |spec|
spec.name = "MiCallSDK"
spec.version = "1.0.1"
spec.summary = "MiCallSDK Framework"
spec.description = "MiCallSDK easy to make call/video call app2app, app2phone"
spec.homepage = "https://github.com/ldev1710/micall-sdk"
spec.license = { :type => "MIT", :file => "LICENSE" }
spec.author = { 'LDev' => 'luongdien1211@gmail.com' }
spec.platform = :ios, "13.0"
spec.swift_version = '5.0'
spec.source = { :git => "https://github.com/ldev1710/micall-sdk.git", :tag => spec.version.to_s }
spec.source_files = "MiCallSDK/MiCallSDK/**/*.{swift}"
spec.public_header_files = 'MiCallSDK/Headers/*.h'
spec.frameworks = 'VideoToolbox', 'AudioToolbox', 'AVFoundation', 'CoreMedia','Foundation'
end
