// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-docc-sample-nested-types",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "swift-docc-sample-nested-types",
            targets: ["NestedTypes"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-docc-symbolkit", branch: "main"),
        .package(url: "https://github.com/themomax/swift-docc-plugin", branch: "add-extended-types-flag"),
        // .package(path: "../../apple/swift-docc-plugin"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "NestedTypes",
            dependencies: [
                .product(name: "SymbolKit", package: "swift-docc-symbolkit"),
                .targetItem(name: "SomeSymbolKitExtension", condition: nil)
            ]),
        .target(
            name: "SomeSymbolKitExtension",
            dependencies: [
                .product(name: "SymbolKit", package: "swift-docc-symbolkit"),
            ]),
    ]
)
