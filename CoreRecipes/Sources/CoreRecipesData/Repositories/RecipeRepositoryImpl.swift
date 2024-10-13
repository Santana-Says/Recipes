import CoreRecipesDomain
import Foundation

class RecipeRepositoryImpl {
    private let recipesService: RecipeService
    
    init(recipesService: RecipeService) {
        self.recipesService = recipesService
    }
}

extension RecipeRepositoryImpl: RecipeRepository {
    func fetchRecipes() async -> [Recipe]? {
        guard let response = try? await recipesService.fetchRecipes() else { return nil }
        
        return response.recipes
    }
}
