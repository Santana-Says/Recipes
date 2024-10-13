import CoreRecipesDomain
import Foundation
import Swinject

class RecipeListViewModel: ObservableObject {
    @Published private(set) var recipes = [Recipe]()
    
    let recipeRepository: RecipeRepository
    
    init() {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            recipeRepository = RecipeRepositoryMockImpl()
        } else {
            recipeRepository = CoreRecipesPresentationRoot.sharedContainer.resolve(RecipeRepository.self)!
        }
        
        getRecipes()
    }
    
    func getRecipes() {
        Task {
            guard let recipes = await recipeRepository.fetchRecipes() else {
                updateRecipes([])
                return
            }
            
            updateRecipes(recipes)
        }
    }
    
    private func updateRecipes(_ recipes: [Recipe]) {
        DispatchQueue.main.async {
            self.recipes = recipes
        }
    }
}
