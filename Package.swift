// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "MiCallSDK",
    products: [
        .library(name: "MiCallSDK", targets: ["MiCallSDK"]),
        .executable(name: "PJSua2", targets: ["PJSua2"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MiCallSDK",
            path: "./MiCallSDK"
        ),
        .target(
            name: "PJSua2",
            path: "./PJSua2/include",
            publicHeadersPath: "./PJSua2/include"
        ),
    ]
)
