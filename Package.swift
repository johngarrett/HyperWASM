// swift-tools-version:5.3

import PackageDescription
let package = Package(
    name: "HyperWasm",
    products: [
        .executable(name: "HyperWasm", targets: ["HyperWasm"])
    ],
    dependencies: [
        .package(name: "JavaScriptKit", url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.8.0"),
        .package(url: "https://github.com/johngarrett/HyperSwift", .branch("master"))
    ],
    targets: [
        .target(
            name: "HyperWasm",
            dependencies: [
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "HyperSwift", package: "HyperSwift")
            ]),
    ]
)
