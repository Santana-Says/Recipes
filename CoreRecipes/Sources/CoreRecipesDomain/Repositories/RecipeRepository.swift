//
//  File.swift
//  
//
//  Created by Jeffrey Santana on 10/12/24.
//

import Foundation

public protocol RecipeRepository {
    func fetchRecipes(fromSource source: RecipeSourceDataType) async -> [Recipe]?
}
