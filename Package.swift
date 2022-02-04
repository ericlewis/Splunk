// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Splunk",
    platforms: [
      .iOS("14.0"),
      .macOS("11.0"),
      .tvOS("14.0"),
      .watchOS("7.0")
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
