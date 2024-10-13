// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreRecipes",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(name: "CoreRecipes", targets: ["CoreRecipes"]),
        .library(name: "CoreRecipesData",targets: ["CoreRecipesData"]),
        .library(name: "CoreRecipesDomain",targets: ["CoreRecipesDomain"]),
        .library(name: "CoreRecipesPresentation",targets: ["CoreRecipesPresentation"])
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", from: "8.1.0"),
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0")
    ],
    targets: [
        .target(name: "CoreRecipes"),
        .target(name: "CoreRecipesData", dependencies: ["CoreRecipesDomain"]),
        .target(name: "CoreRecipesDomain", dependencies: ["Swinject"]),
        .target(name: "CoreRecipesPresentation", dependencies: ["CoreRecipesDomain", "Kingfisher"]),
        .testTarget(
            name: "CoreRecipesTests",
            dependencies: ["CoreRecipes"]),
    ]
)
