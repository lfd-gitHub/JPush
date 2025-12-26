// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JPushSDK",
    platforms: [.iOS(.v15)],
    products: [.library(name: "JPush", targets: ["JPush"])],
    targets: [
        .binaryTarget(
            name: "_JPushBinary",
            url: "https://github.com/lfd-gitHub/JPush/releases/download/jpush-5.7.0-jcore-5.1.0/jpush-ios-5.7.0.xcframework.zip",
            checksum: "4fbde5fb18e3a5321d936bf2c83e23a7efa1b7f0139c5a8f76c6f375b0874b76"
        ),
        .binaryTarget(
            name: "JCore",
            url: "https://github.com/lfd-gitHub/JPush/releases/download/jpush-5.7.0-jcore-5.1.0/jcore-ios-5.1.0.xcframework.zip",
            checksum: "b3b057d6cbf385173f0e432d8d412823fdc1491da41e983a6c7aa2621a7529e3"
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
                //.unsafeFlags(["-ObjC"], .when(platforms: [.iOS])),
                .unsafeFlags(["-Xlinker", "-objc"])
            ]
        ),
    ]
)
