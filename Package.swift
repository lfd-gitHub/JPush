// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JPushSDK",
    products: [.library(name: "JPush", targets: ["JPush"])],
    targets: [
        .binaryTarget(
            name: "_JPushBinary",
            url: "https://github.com/excellemed/JPush/releases/download/jpush-5.7.0-jcore-5.1.0/jpush-ios-5.7.0.xcframework.zip",
            checksum: "96666f6c61ffce0e5bfb8f2cb45e2d6706a606becc9fa3f22c10dced30e576f9",
        ),
        .binaryTarget(
            name: "JCore",
            url: "https://github.com/excellemed/JPush/releases/download/jpush-5.7.0-jcore-5.1.0/jcore-ios-5.1.0.xcframework.zip",
            checksum: "9374d07939bb2b8d3ec911318f1b1cb7cd099069482ff9850ef4224458da9fc1",
        ),
        .target(
            name: "_JPush",
            dependencies: ["_JPushBinary"],
            path: "Sources/_JPush",
            publicHeadersPath: "Headers"
        ),
        .target(
            name: "JPush",
            dependencies: ["_JPush", "JCore"],
            path: "Sources/JPush",
            sources: ["."],
            linkerSettings: [
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("Security"),
                .linkedFramework("AdSupport"),
                .linkedFramework("UserNotifications"),
                .linkedFramework("WebKit"),
                .linkedFramework("AppTrackingTransparency"),
                .linkedFramework("StoreKit"),
                .linkedLibrary("z"),
                .linkedLibrary("resolv"),
                .linkedLibrary("sqlite3"),
                .unsafeFlags(["-ObjC"], .when(platforms: [.iOS])),
            ]
        ),
    ]
)
