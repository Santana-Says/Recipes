//
//  RecipesApp.swift
//  Recipes
//
//  Created by Jeffrey Santana on 10/12/24.
//

import CoreRecipesData
import CoreRecipesPresentation
import SwiftUI

@main
struct RecipesApp: App {
    init() {
        CoreRecipesDataRoot().registerRoot()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
