import Foundation

public class RecipeRepositoryMockImpl: RecipeRepository {
    public init() {
        
    }
    
    public func fetchRecipes() async -> [Recipe]? {
        MockRecipeData.recipes
    }
}
