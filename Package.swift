// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HyperWASM",
    products: [
        .executable(name: "HyperWASM", targets: ["HyperWASM"])
    ],
    dependencies: [
        .package(url: "https://github.com/johngarrett/HyperSwift", .branch("master")),
//        .package(name: "JavaScriptKit", url: "https://github.com/swiftwasm/JavaScriptKit.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "HyperWASM",
            dependencies: ["HyperSwift"]),
        .testTarget(
            name: "HyperWASMTests",
            dependencies: ["HyperWASM"]),
    ]
)
