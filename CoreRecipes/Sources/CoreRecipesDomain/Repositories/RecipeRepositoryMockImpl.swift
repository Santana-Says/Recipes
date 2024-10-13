import Foundation

public class RecipeRepositoryMockImpl: RecipeRepository {
    public init() {
        
    }
    
    public func fetchRecipes(fromSource source: RecipeSourceDataType) async -> [Recipe]? {
        MockRecipeData.recipes
    }
}
