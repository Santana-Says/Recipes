import CoreRecipesDomain
import Foundation
import Swinject

public class CoreRecipesDataRoot {
    static var sharedContainer = Container()
    
    public init(rootContainer: Container) {
        CoreRecipesDataRoot.sharedContainer = rootContainer
    }
}

extension CoreRecipesDataRoot: DependencyInjectionRoot {
    public func registerRoot() {
        let sharedContainer = CoreRecipesDataRoot.sharedContainer
        
        sharedContainer.register(RecipeRepository.self) { resolver in
            let recipeService = resolver.resolve(RecipeService.self)!
            
            return RecipeRepositoryImpl(recipesService: recipeService)
        }
        
        sharedContainer.register(RecipeService.self) { _ in
            RecipeServiceImpl()
        }
    }
}
