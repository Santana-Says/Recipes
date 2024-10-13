import Combine
import CoreRecipesDomain
import Foundation
import Swinject

class RecipeListViewModel: ObservableObject {
    @Published private(set) var recipes = [Recipe]()
    @Published var sourceData = RecipeSourceDataType.original
    
    private var cancellables = Set<AnyCancellable>()
    let recipeRepository: RecipeRepository
    
    init() {
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            recipeRepository = RecipeRepositoryMockImpl()
        } else {
            recipeRepository = CoreRecipesPresentationRoot.sharedContainer.resolve(RecipeRepository.self)!
        }
        
        getRecipes()
        
        $sourceData
            .sink { [weak self] _ in
                self?.getRecipes()
            }
            .store(in: &cancellables)
    }
    
    func getRecipes() {
        Task {
            guard let recipes = await recipeRepository.fetchRecipes(fromSource: sourceData) else {
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
