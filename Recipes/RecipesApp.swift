//
//  RecipesApp.swift
//  Recipes
//
//  Created by Jeffrey Santana on 10/12/24.
//

import CoreRecipesData
import CoreRecipesPresentation
import SwiftUI
import Swinject

@main
struct RecipesApp: App {
    let container = Container()
    
    init() {
        CoreRecipesDataRoot(rootContainer: container).registerRoot()
        CoreRecipesPresentationRoot(rootContainer: container).registerRoot()
    }
    
    var body: some Scene {
        WindowGroup {
            RecipeListView()
        }
    }
}
