// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "MiCallSDK",
    products: [
        .library(name: "MiCallSDK", targets: ["MiCallSDK"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MiCallSDK",
            dependencies:["PJSua2"]
        ),
        .target(
            name: "PJSua2",
            publicHeadersPath: "./"
        ),
    ]
)
