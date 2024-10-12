// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreRecipes",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "CoreRecipes", targets: ["CoreRecipes"]),
        .library(name: "CoreRecipesData",targets: ["CoreRecipesData"]),
        .library(name: "CoreRecipesDomain",targets: ["CoreRecipesDomain"]),
        .library(name: "CoreRecipesPresentation",targets: ["CoreRecipesPresentation"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "CoreRecipes"),
        .target(name: "CoreRecipesData", dependencies: ["CoreRecipesDomain"]),
        .target(name: "CoreRecipesDomain"),
        .target(name: "CoreRecipesPresentation", dependencies: ["CoreRecipesDomain"]),
        .testTarget(
            name: "CoreRecipesTests",
            dependencies: ["CoreRecipes"]),
    ]
)
