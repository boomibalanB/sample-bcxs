// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "sample-bcxs",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "BoldCXSupportSDK",
            targets: ["BoldCXSupportSDKWrapper"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/getsentry/sentry-cocoa.git",
            from: "8.57.0"
        )
    ],
    targets: [
        .binaryTarget(
            name: "BoldCXSupportSDKBinary",
            path: "./BoldCXSupportSDK.xcframework"
        ),
        .target(
            name: "BoldCXSupportSDKWrapper",
            dependencies: [
                "BoldCXSupportSDKBinary",
                .product(name: "Sentry", package: "sentry-cocoa")
            ]
        )
    ]
)
