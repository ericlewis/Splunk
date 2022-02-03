// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Splunk",
    platforms: [
      .iOS("13.0"),
      .macOS("10.15"),
      .tvOS("13.0"),
      .watchOS("6.0")
    ],
    products: [
        .library(name: "Splunk",
                 targets: ["Splunk"]),
        .library(
            name: "SplunkCore",
            targets: ["SplunkCore"]),
        .library(
            name: "SplunkColor",
            targets: ["SplunkColor"]),
    ],
    targets: [
        .target(
          name: "Splunk",
          dependencies: ["SplunkCore", "SplunkColor"]),
        .target(
            name: "SplunkCore",
            dependencies: []),
        .target(
            name: "SplunkColor",
            dependencies: ["SplunkCore"]),
    ]
)
