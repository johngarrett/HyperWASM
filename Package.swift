// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "HyperC",
    products: [
        .executable(name: "HyperC", targets: ["HyperC"])
    ],
    dependencies: [
        .package(name: "JavaScriptKit", url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.8.0"),
        .package(url: "https://github.com/johngarrett/HyperSwift", .branch("master"))
    ],
    targets: [
        .target(
            name: "HyperC",
            dependencies: [
                .product(name: "JavaScriptKit", package: "JavaScriptKit"),
                .product(name: "HyperSwift", package: "HyperSwift")
            ]),
    ]
)
