//
//  File.swift
//  
//
//  Created by Jeffrey Santana on 10/12/24.
//

import CoreRecipesDomain
import Foundation

class RecipeRepositoryImpl {
    let recipesService = RecipeService()
}

extension RecipeRepositoryImpl: RecipeRepository {
    func fetchRecipes() async -> [Recipe]? {
        guard let response = try? await recipesService.fetchRecipes() else { return nil }
        
        return response.recipes
    }
}
